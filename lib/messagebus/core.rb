require 'rails'

module MessageBus
  class MessageBusRailtie < Rails::Railtie
    private_class_method :new # MessageBusRailtie is not intend to be instantiated

  	initializer "message bus initializer" do
  		if defined?(Rails::Console)
        flag = MessageBusRailtie::server_started?
        MessageBusRailtie::find_server if flag
      else
        MessageBusRailtie::start_server
        MessageBusRailtie::setup_filesystem_monitor
      end
  	end


    def self.server_started?
      server = ActiveSupport::MessageBus::MessageServer.instance
      server.started?
    end

    def self.find_server
      remote_server = ActiveSupport::MessageBus::MessageServer.instance
      remote_server.find_server # broadcast to find local server
    end

    def self.start_server
      server = ActiveSupport::MessageBus::MessageServer.instance
      server.start_server :deploy => :InProc # started in work thread
    end

    def self.setup_filesystem_monitor
      opts = {:notifications => "filesystem_changes", :recurse => true}
      monitor_path = Rails.root

      listener = ActiveSupport::FileUpdateChecker.new([monitor_path], {}, opts)
      Thread.new do
        listener.start_listening
      end

      ActiveSupport::Notifications.subscribe("filesystem_changes") do |*args|
        server = ActiveSupport::MessageBus::MessageServer.instance
        begin
          server.send_message args, true
        rescue Error => err
          puts "Failed to send message.(#{err})"
        end
      end
    end
  end
end
require 'rails'

module MessageBus
  class MessageBusRailtie < Rails::Railtie
  	initializer "message bus initializer" do
  		puts "TODO: Add initialization code here."
  	end
  end
end
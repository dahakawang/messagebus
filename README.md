# MessageBus

MessageBus is a mechanism to push messages from rails server to browser under development mode.

By default, MessageBus  will detect your rails application's file system changes and notify your browser
the changes(using SSE). This will make you a happier develpment life since you do not need to refresh 
browser manually \\^_^/. 

MessageBus is a generic solution for message pushing from rails server(and rails console) to browser, you can push any 
data to the browser. Since your data will pass through a DRb server, your arbitrary data must follow the requirements of 
the DRb server.

**You are recommmanded to use MessageBus ONLY in dev mode.**

## Installation

Add this line to your rails application's Gemfile:

    gem 'messagebus'

And then execute:

    $ bundle install

And the MessageBus is enabled in your rails app(for both the application and the console)

## Usage

Once the Gem is required and then MessageBus is initalized with no problem, you can push message from you code as following:
    
    ActiveSupport::MessageBus::MessageServer.instance.send_message "hello world"
    
or push some data

    ActiveSupport::MessageBus::MessageServer.instance.send_message {id: 34566, name: "david", content: "....."}

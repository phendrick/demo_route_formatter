require "demo_route_formatter"
require "rails"
require "action_dispatch/routing/inspector"
require "demo_route_formatter/formatters/emoji"

module DemoRouteFormatter
  class Railtie < Rails::Railtie
    railtie_name :demo_route_formatter

    ActionDispatch::Routing::ConsoleFormatter.register_formatter(EmojiFormatter, "emoji")

    rake_tasks do 
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").map { |file| load file }
    end

  end
end

class EmojiFormatter < ActionDispatch::Routing::ConsoleFormatter::Base
  def draw(application_routes:, engines:)
    compact = ARGV.collect { |arg| arg.gsub(/^-+/, "") }.include?("compact")

    section(application_routes)

    engines.each do |name, engine_routes|
      add "\nRoutes for #{name}"

      section(engine_routes)
    end
  end

  private 
  def header(routes)
    name_width, verb_width, path_width = widths(routes)
    add "#{"Prefix".rjust(name_width)} #{"Verb"} Controller#Action"
  end

  def section(routes)
    header_lengths = ["Prefix", "Verb", "Controller"].map(&:length)
    name_width, verb_width, path_width = widths(routes).zip(header_lengths).map(&:max)

    routes.map do |r|
      vemoji = case r[:verb]
      when "GET"
        "🐶"
      when "POST"
        "📬"
      when "PATCH"
        "🤡"
      when "PUT"
        "🧯"
      when "DELETE"
        "🙈"
      else
        "🦁"
      end

      add "#{r[:name].rjust(name_width)}  #{vemoji}  #{r[:path]}"
    end
  end
end

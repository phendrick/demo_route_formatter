class EmojiFormatter < ActionDispatch::Routing::ConsoleFormatter::Base
  def header(routes)
    name_width, verb_width, path_width = widths(routes)
    "#{"Prefix".rjust(name_width)} #{"Verb"} Controller#Action"
  end

  def section(routes)
    header_lengths = ["Prefix", "Verb", "Controller"].map(&:length)
    name_width, verb_width, path_width = widths(routes).zip(header_lengths).map(&:max)

    compact = ARGV.collect { |arg| arg.gsub(/^-+/, "") }.include?("compact")

    routes.reject do |r|
      compact ? 
        r[:path].match(/^\/rails\/(active_storage|action_mailbox|conductor\/action_mailbox)/) ||
        r[:path].match(/^\/([^_]+)_historical_location/)
      : false
    end.map do |r|
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

      "#{r[:name].rjust(name_width)}  #{vemoji}  #{r[:path]}"
    end
  end
end

class EmojiFormatter < ActionDispatch::Routing::ConsoleFormatter::Base
  def draw(routes, title = "")
    routes.reject! do |route|
      route[:path] =~ /\/rails\// || route[:name] =~ /^turbo_/
    end
    
    puts section(routes)
  end

  def section(routes, title = "")
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

      [vemoji, r[:name], r[:path]].compact_blank.join(" ")
    end
  end
end

require 'colorize'

class FunkyFormatter < ActionDispatch::Routing::ConsoleFormatter::SheetFormatter
  def initialize
    @buffer = []
  end

  def draw(routes, title = "")
    @buffer << "\n\n#{"[ #{title} ]"}".blue.on_yellow.underline if title.present?
    
    name_width, verb_width, path_width = widths(routes)

    colors = [
      {color: :light_blue, background: :cyan, mode: [:default, :bold, :italic, :underline, :blink, :swap, :hide].sample},
      {color: :light_yellow, background: :blue, mode: [:default, :bold, :italic, :underline, :blink, :swap, :hide].sample},
      {color: :light_red, background: :light_yellow, mode: [:default, :bold, :italic, :underline, :blink, :swap, :hide].sample},
      {color: :light_blue, background: :black, mode: [:default, :bold, :italic, :underline, :blink, :swap, :hide].sample},
      {color: :light_magenta, background: :white, mode: [:default, :bold, :italic, :underline, :blink, :swap, :hide].sample},
    ]

    routes.reject! do |route|
      route[:path] =~ /\/rails\// || route[:name] =~ /^turbo_/
    end

    routes.map do |r|
      @buffer << "#{r[:verb].ljust(8)} #{r[:path].ljust(40)} #{r[:name].rjust(name_width)}  #{r[:reqs]}"
                    .ljust(IO.console_size[1])
                    .colorize(colors.sample)
    end
  end

end

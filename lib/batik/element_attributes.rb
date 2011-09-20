module Batik
  module ElementAttributes
    def coordinates(x, y)
      if ['circle', 'ellipse'].include?(type)
        @attributes[:cx] = x
        @attributes[:cy] = y
      else
        @attributes[:x] = x
        @attributes[:y] = y
      end
    end

    def dimensions(width, height)
      @attributes[:width] = width
      @attributes[:height] = height
    end

    def color(options)
      @attributes[:fill] = options[:fill] if options[:fill]
      @attributes[:stroke] = options[:stroke] if options[:stroke]
    end

    def radius(r, ry = nil)
      if ry # ellipse
        @attributes[:rx] = r
        @attributes[:ry] = ry
      else
        @attributes[:r] = r
      end
    end

    def body(text)
      @attributes[:body] = text
    end

    def move(x, y)
      @attributes[:d] ||= ""
      @attributes[:d] += "M #{x} #{y} "
    end

    def line(x, y)
      @attributes[:d] ||= ""
      @attributes[:d] += "L #{x} #{y} "
    end

    def horizontal_line(x)
      @attributes[:d] ||= ""
      @attributes[:d] += "H #{x} "
    end

    def vertical_line(y)
      @attributes[:d] ||= ""
      @attributes[:d] += "V #{y} "
    end

    def curve(x1, y1, x2, y2, x, y)
      @attributes[:d] ||= ""
      @attributes[:d] += "C #{x1} #{y1} #{x2} #{y2} #{x} #{y} "
    end

    def smooth_curve(x2, y2, x, y)
      @attributes[:d] ||= ""
      @attributes[:d] += "S #{x2} #{y2} #{x} #{y} "
    end

    def close
      @attributes[:d] ||= ""
      @attributes[:d] += "Z "
    end

    def link(href)
      @attributes['xlink-href'] = href
    end
  end
end

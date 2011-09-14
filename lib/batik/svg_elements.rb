module Batik
  module SVGElements
    def rectangle(attributes)
      @elements << Rectangle.new(attributes)
    end

    def circle(attributes)
      @elements << Circle.new(attributes)
    end

    def text(attributes)
      @elements << Text.new(attributes)
    end

    def path(attributes)
      @elements << Path.new(attributes)
    end

    def ellipse(attributes)
      @elements << Ellipse.new(attributes)
    end

    def polygon(attributes)
      @elements << Polygon.new(attributes)
    end

    def image(attributes)
      @elements << Image.new(attributes)
    end

    def g(attributes, &block)
      @elements << G.new(attributes, &block)
    end
  end
end

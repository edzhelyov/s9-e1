module Batik
  module SVGElements
    def g(attributes, &block)
      @elements << Group.new(attributes, &block)
    end
  end
end

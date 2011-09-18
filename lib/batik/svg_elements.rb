module Batik
  module SVGElements
    def group(attributes, &block)
      @elements << Group.new(attributes, &block)
    end
  end
end

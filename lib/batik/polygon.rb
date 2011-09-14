module Batik
  class Polygon < Element
    def initialize(attributes)
      super
      @type = 'polygon'
    end
  end
end

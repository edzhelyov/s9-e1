module Batik
  class Polygon
    include Element 

    def initialize(attributes)
      super
      @type = 'polygon'
    end
  end
end

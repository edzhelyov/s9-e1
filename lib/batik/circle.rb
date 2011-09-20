module Batik
  class Circle
    include Element
    include ElementAttributes::CircleCoordinates

    def radius(r)
      @attributes[:r] = r
    end
    

    set_type 'circle'
    register 'circle'
  end
end

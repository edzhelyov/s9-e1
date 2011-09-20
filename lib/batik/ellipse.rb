module Batik
  class Ellipse
    include Element
    include ElementAttributes::CircleCoordinates

    def radius(rx, ry)
      @attributes[:rx] = rx
      @attributes[:ry] = ry
    end

    set_type 'ellipse'
    register 'ellipse'
  end
end

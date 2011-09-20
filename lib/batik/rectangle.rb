module Batik
  class Rectangle
    include Element 
    include ElementAttributes::Coordinates
    include ElementAttributes::Dimension

    set_type 'rect'
    register 'rectangle'
  end
end

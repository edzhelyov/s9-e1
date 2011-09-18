module Batik
  class Rectangle
    include Element 

    def initialize(attributes)
      super
      @type = 'rect'
    end
  end
end

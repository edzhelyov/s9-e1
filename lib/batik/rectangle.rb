module Batik
  class Rectangle < Element
    def initialize(attributes)
      super
      @type = 'rect'
    end
  end
end

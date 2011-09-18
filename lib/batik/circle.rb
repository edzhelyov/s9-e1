module Batik
  class Circle
    include Element

    def initialize(attributes)
      super
      @type = 'circle'
    end
  end
end

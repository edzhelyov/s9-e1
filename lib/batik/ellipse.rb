module Batik
  class Ellipse
    include Element

    def initialize(attributes)
      super
      @type = 'ellipse'
    end
  end
end

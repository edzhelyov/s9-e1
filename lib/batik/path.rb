module Batik
  class Path
    include Element

    def initialize(attributes)
      super
      @type = 'path'
    end
  end
end

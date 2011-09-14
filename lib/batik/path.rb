module Batik
  class Path < Element
    def initialize(attributes)
      super
      @type = 'path'
    end
  end
end

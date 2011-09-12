module Batik
  class Element
    attr_reader :type, :attributes

    def initialize(attributes)
      @attributes = attributes
    end
  end
end

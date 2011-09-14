module Batik
  class SVG
    attr_reader :elements

    def initialize(options = {}, &block)
      @root_attributes = options
      @elements = []

      instance_exec(&block) if block_given?
    end

    def to_s
      document = Document.new(@root_attributes, @elements)

      document.to_s
    end

    def rectangle(attributes)
      @elements << Rectangle.new(attributes)
    end

    def circle(attributes)
      @elements << Circle.new(attributes)
    end

    def text(attributes)
      @elements << Text.new(attributes)
    end

    def path(attributes)
      @elements << Path.new(attributes)
    end
  end
end

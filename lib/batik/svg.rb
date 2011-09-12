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

    def rectangle(options)
      @elements << Rectangle.new(options)
    end

    def circle(options)
      @elements << Circle.new(options)
    end
  end
end

module Batik
  import org.apache.batik.dom.svg.SVGDOMImplementation
  import org.apache.batik.dom.util.DOMUtilities
  import java.io.StringWriter

  class SVG
    attr_reader :elements

    def initialize(options = {}, &block)
      @root_attributes = options
      @elements = []

      instance_exec(&block) if block_given?
    end

    def to_s
      document = create_svg_document
      set_root_attributes(document)
      draw_all_elements(document)

      writer = StringWriter.new

      DOMUtilities.writeDocument document, writer

      writer.to_s
    end

    def create_svg_document
      dom = SVGDOMImplementation.getDOMImplementation
      dom.createDocument SVGDOMImplementation::SVG_NAMESPACE_URI, "svg", nil
    end

    def set_root_attributes(document)
      root = document.getDocumentElement
      @root_attributes.each do |key, value|
        root.setAttributeNS nil, key.to_s, value.to_s
      end
    end

    def draw_all_elements(document)
      @elements.each do |element|
        element.draw_to(document)
      end
    end

    def rectangle(options)
      @elements << Rectangle.new(options)
    end

    def circle(options)
      @elements << Circle.new(options)
    end
  end
end

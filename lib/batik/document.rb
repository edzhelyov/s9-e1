module Batik
  import org.apache.batik.dom.svg.SVGDOMImplementation
  import org.apache.batik.dom.util.DOMUtilities
  import java.io.StringWriter

  class Document
    attr_reader :elements

    def initialize(options = {}, &block)
      @root_attributes = options
      @elements = []

      instance_exec(&block) if block_given?
    end

    def to_svg
      document = create_svg_document
      set_root_attributes(document)

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

#    def root
#      svg_document.getDocumentElement
#    end
#
#    def width(value)
#      root.setAttributeNS nil, 'width', value.to_s
#    end
#
#    def height(value)
#      root.setAttributeNS nil, 'height', value.to_s
#    end
#
#    def rectangle(options)
#      element = svg_document.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, 'rect')
#      options.each do |key, value|
#        element.setAttributeNS nil, key.to_s, value.to_s
#      end
#
#      root.appendChild element
#    end
#
#    def circle(options)
#      element = svg_document.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, 'circle')
#      options.each do |key, value|
#        element.setAttributeNS nil, key.to_s, value.to_s
#      end
#
#      root.appendChild element
#    end
  end
end

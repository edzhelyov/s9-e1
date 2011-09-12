module Batik
  import org.apache.batik.dom.svg.SVGDOMImplementation
  import org.apache.batik.dom.util.DOMUtilities
  import java.io.StringWriter

  module Document
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.initialize_svg_namespace
    end

    module InstanceMethods
      def to_svg
        writer = StringWriter.new

        DOMUtilities.writeDocument self.class.svg_document, writer

        writer.to_s
      end
    end

    module ClassMethods
      def svg_document
        @svg_document
      end

      def svg_document=(doc)
        @svg_document = doc
      end

      def root
        svg_document.getDocumentElement
      end

      def initialize_svg_namespace
        dom = SVGDOMImplementation.getDOMImplementation
        self.svg_document = dom.createDocument SVGDOMImplementation::SVG_NAMESPACE_URI, "svg", nil
      end

      def width(value)
        root.setAttributeNS nil, 'width', value.to_s
      end

      def height(value)
        root.setAttributeNS nil, 'height', value.to_s
      end

      def rectangle(options)
        element = svg_document.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, 'rect')
        options.each do |key, value|
          element.setAttributeNS nil, key.to_s, value.to_s
        end

        root.appendChild element
      end
    end
  end
end

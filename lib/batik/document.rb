module Batik
  import org.apache.batik.dom.svg.SVGDOMImplementation
  import org.apache.batik.dom.util.DOMUtilities
  import java.io.StringWriter

  class Document
    def initialize(root_attributes, elements)
      create_document
      set_attributes(@root, root_attributes)
      create_and_append_elements(elements)
    end

    def create_document
      dom = SVGDOMImplementation.getDOMImplementation
      @doc = dom.createDocument(SVGDOMImplementation::SVG_NAMESPACE_URI, "svg", nil)
      @root = @doc.getDocumentElement
    end

    def set_attributes(element, attributes)
      attributes.each do |key, value|
        element.setAttributeNS(nil, key.to_s, value.to_s)
      end
    end

    def create_and_append_elements(elements)
      elements.each do |object|
        element = @doc.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, object.type)
        set_attributes(element, object.attributes)
        set_text(element, object) if object.type == 'text'

        @root.appendChild(element)
      end
    end

    def set_text(element, object)
      element.appendChild(@doc.createTextNode(object.text))
    end

    def to_s
      writer = StringWriter.new
      DOMUtilities.writeDocument(@doc, writer)
      writer.to_s
    end
  end
end

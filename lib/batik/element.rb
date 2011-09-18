module Batik
  class Element
    attr_reader :type, :attributes

    include AttributeMethods

    def initialize(attributes = {})
      @attributes = attributes
    end

    def to_batik_element(doc)
      batik_element = doc.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, type)
      set_attributes(batik_element, attributes)

      batik_element
    end
  end
end

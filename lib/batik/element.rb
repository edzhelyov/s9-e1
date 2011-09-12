module Batik
  class Element
    attr_reader :type

    def initialize(attributes)
      @attributes = attributes
    end

    def draw_to(document)
      element = document.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, type)
      @attributes.each do |key, value|
        element.setAttributeNS nil, key.to_s, value.to_s
      end

      root = document.getDocumentElement
      root.appendChild element
    end
  end
end

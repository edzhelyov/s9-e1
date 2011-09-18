module Batik
  module Element
    def self.included(base)
      base.class_eval <<-EOS
        attr_reader :type, :attributes

        def self.type(name)
          @type = name
        end
      EOS
    end

    include AttributeMethods

    def initialize(attributes = {})
      @attributes = attributes
    end

    def to_batik_element(doc)
      batik_element = doc.createElementNS(SVGDOMImplementation::SVG_NAMESPACE_URI, type)
      set_attributes(batik_element, attributes)

      batik_element
    end

    def type
      self.class.type
    end
  end
end

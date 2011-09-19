module Batik
  module Element
    def self.included(base)
      base.extend ClassMethods
      base.send(:include, InstanceMethods)
    end

    module ClassMethods
      def set_type(name)
        @type = name
      end

      def type
        @type
      end

      def register(method_name)
        Batik::SVGElements.register(method_name, self)
      end
    end

    module InstanceMethods
      attr_reader :attributes

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
end

module Batik
  class Element

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
      include ElementAttributes::Color
      include ElementAttributes::Transformations

      def initialize(attributes = {}, &block)
        @attributes = attributes

        instance_exec(&block) if block_given?
      end

      def to_batik_element(doc)
        namespace = SVGDOMImplementation::SVG_NAMESPACE_URI
        batik_element = doc.createElementNS(namespace, type)
        set_attributes(batik_element, attributes)

        batik_element
      end

      def type
        self.class.type
      end
    end

    extend ClassMethods
    include InstanceMethods
  end
end

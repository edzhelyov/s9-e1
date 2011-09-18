module Batik
  class Group
    attr_reader :elements

    include Element 
    include SVGElements

    set_type 'g'

    def initialize(attributes = {}, &block)
      super
      @elements = []

      instance_exec(&block) if block_given?
    end

    def to_batik_element(doc)
      batik_element = super
      # TODO: This duplicates the code from Document#append_elements
      elements.each do |element|
        batik_element.appendChild(element.to_batik_element(doc))
      end
      
      batik_element
    end
  end
end

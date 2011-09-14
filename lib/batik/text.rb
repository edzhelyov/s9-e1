module Batik
  class Text < Element
    attr_reader :text

    def initialize(attributes)
      @text = attributes.delete(:body)
      super
      @type = 'text'
    end

    def to_batik_element(doc)
      batik_element = super
      batik_element.appendChild(doc.createTextNode(text))
      batik_element
    end
  end
end

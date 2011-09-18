module Batik
  class Text
    attr_reader :text

    include Element

    set_type 'text'

    def initialize(attributes = {})
      super
      @text = @attributes.delete(:body)
    end

    def to_batik_element(doc)
      batik_element = super
      batik_element.appendChild(doc.createTextNode(text))
      batik_element
    end
  end
end

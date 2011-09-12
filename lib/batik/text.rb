module Batik
  class Text < Element
    attr_reader :text

    def initialize(attributes)
      @text = attributes.delete(:body)
      super
      @type = 'text'
    end
  end
end

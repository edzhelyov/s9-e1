module Batik
  class Image < Element
    def initialize(attributes)
      super
      @type = 'image'
      convert_href_attribute
    end

    def convert_href_attribute
      href = @attributes.delete(:href) || @attributes.delete('href')
      @attributes['xlink-href'] = href
    end
  end
end

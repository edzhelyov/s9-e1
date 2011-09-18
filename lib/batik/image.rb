module Batik
  class Image
    include Element

    set_type 'image'

    def initialize(attributes = {})
      super
      convert_href_attribute
    end

    def convert_href_attribute
      href = @attributes.delete(:href) || @attributes.delete('href')
      @attributes['xlink-href'] = href
    end
  end
end

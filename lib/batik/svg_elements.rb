module Batik
  module SVGElements
    def self.register(method_name, klass)
      define_method method_name.to_sym do |attributes|
        @elements << klass.new(attributes)
      end
    end

    def group(attributes, &block)
      @elements << Group.new(attributes, &block)
    end
  end
end

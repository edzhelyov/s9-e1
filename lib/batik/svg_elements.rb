module Batik
  module SVGElements
    def self.register(method_name, klass)
      define_method method_name.to_sym do |attributes|
        @elements << klass.new(attributes || {})
      end
    end

    def self.register_with_block(method_name, klass)
      define_method method_name.to_sym do |attributes, &block|
        @elements << klass.new(attributes || {}, &block)
      end
    end
  end
end

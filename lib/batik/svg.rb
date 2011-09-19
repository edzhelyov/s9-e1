module Batik
  class SVG
    attr_reader :elements

    include SVGElements

    def self.draw(*args, &block)
      options = extract_options(args)
      filename = args.first

      svg = new(options, &block)

      if filename
        File.open(filename, 'w+') do |file|
          file << svg.to_s
        end
      else
        svg.to_s
      end
    end

    def initialize(options = {}, &block)
      @root_attributes = options
      @elements = []

      instance_exec(&block) if block_given?
    end

    def to_s
      document = Document.new(@root_attributes, @elements)

      document.to_s
    end

    private
    def self.extract_options(args)
      if args.last.is_a?(Hash)
        args.pop
      else
        {}
      end
    end
  end
end

require 'java'
require_relative '../vendor/batik-1.7/batik.jar'

require_relative 'batik/attribute_methods'
require_relative 'batik/document'
require_relative 'batik/element'
require_relative 'batik/rectangle'
require_relative 'batik/circle'
require_relative 'batik/text'
require_relative 'batik/svg'

module Batik
  import org.apache.batik

  VERSION = Version.getVersion()
end

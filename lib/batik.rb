require 'java'
require_relative '../vendor/batik-1.7/batik.jar'

require 'batik/document'

module Batik
  import org.apache.batik
  import org.apache.batik.dom.svg.SVGDOMImplementation

  VERSION = Version.getVersion()
end

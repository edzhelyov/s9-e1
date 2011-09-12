require 'java'
require_relative '../vendor/batik-1.7/batik.jar'

require 'batik/element'
require 'batik/rectangle'
require 'batik/circle'
require 'batik/document'

module Batik
  import org.apache.batik

  VERSION = Version.getVersion()
end
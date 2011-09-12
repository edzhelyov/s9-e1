require 'java'
require_relative '../vendor/batik-1.7/batik.jar'

module SVG
  include_package 'org.apache.batik'

  VERSION = Version.getVersion()
end

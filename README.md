# Integration Exercise: SVG Batik Wrapper

[Batik](http://xmlgraphics.apache.org/batik/index.html) is Java library for creatign and manipulating SVG images.

I'm wrapping it into simple interface that allow creation of SVG images using a ruby block construct. The Batik's DOM interface is used, which means you can use the official [w3c specification](http://www.w3.org/TR/SVG/) to define elements.

## Currently supported:

* Rectangle
* Circle
* Text

## Setup

1. Use jruby, version 1.6
2. `export JRUBY_OPTS=--1.9`
3. `gem install rspec`


## Examples

Located in the examples/ directory. You can run them with `jruby -I"lib" examples/example_name.rb` and svg file with the example name will be generated in the current directory.

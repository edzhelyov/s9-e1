require 'spec_helper'

describe Batik::Document do
  class Empty
    include Batik::Document
  end

  context 'when included' do
    it 'provide the minimum svg representation' do
      Empty.new.to_svg.should eq '<svg contentScriptType="text/ecmascript" xmlns:xlink="http://www.w3.org/1999/xlink" zoomAndPan="magnify" contentStyleType="text/css" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" version="1.0"/>'
    end
  end

  describe '.width' do
    class Width
      include Batik::Document

      width 400
    end

    it "set the outer svg element's width" do
      Width.new.to_svg.should match /width="400"/
    end
  end

  describe '.height' do
    class Height
      include Batik::Document

      height 300
    end

    it "set the outer svg element's height" do
      Height.new.to_svg.should match /height="300"/
    end
  end

  describe '.rectangle' do
    class Rectangle
      include Batik::Document

      width 100
      height 100
      rectangle :x => 10, :y => 20, :fill => 'red', :width => 20, :height => 30, :stroke => 2
    end

    it 'creates new rectangle object with the given options' do
      Rectangle.new.to_svg.should match /<rect width="20" x="10" fill="red" height="30" y="20" stroke="2"\/>/
    end
  end
end

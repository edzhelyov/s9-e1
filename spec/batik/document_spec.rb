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
end

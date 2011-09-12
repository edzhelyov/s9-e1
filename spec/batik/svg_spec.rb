require 'spec_helper'

describe Batik::SVG do
  context 'when created' do
    it 'accept options' do
      Batik::SVG.new(:width => 500)
    end

    it 'accept optional block that is evaluated in the new object context' do
      Batik::SVG.new(:width => 500) do
        elements
      end
    end
  end

  context 'when empty' do
    let(:svg) { Batik::SVG.new }

    it 'render to empty svg representation' do
      svg.to_s.should eq '<svg contentScriptType="text/ecmascript" xmlns:xlink="http://www.w3.org/1999/xlink" zoomAndPan="magnify" contentStyleType="text/css" preserveAspectRatio="xMidYMid meet" xmlns="http://www.w3.org/2000/svg" version="1.0"/>'
    end
  end

  context 'when empty, but with options' do
    let(:svg) { Batik::SVG.new(:width => 500, :height => 200) }

    it 'render to empty svg root tag with given options set as attributes' do
      svg.to_s.should match 'width="500"'
      svg.to_s.should match 'height="200"'
    end
  end

  describe '#rectangle' do
    let(:svg) { Batik::SVG.new }

    it 'add new rect object' do
      svg.rectangle :x => 10, :y => 20, :fill => 'red', :width => 20, :height => 30
      svg.to_s.should match /<rect width="20" x="10" fill="red" height="30" y="20"\/>/
    end
  end

  describe '#circle' do
    let(:svg) do
      Batik::SVG.new do
        circle :cx => 10, :cy => 10, :r => 20, :fill => 'blue'
      end
    end

    it 'add new circle object' do
      svg.to_s.should match /<circle fill="blue" r="20" cx="10" cy="10"\/>/
    end
  end
end

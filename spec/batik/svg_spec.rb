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

    it 'add new rect element' do
      svg.rectangle :x => 10, :y => 20, :fill => 'red', :width => 20, :height => 30
      svg.to_s.should match '<rect width="20" x="10" fill="red" height="30" y="20"/>'
    end
  end

  describe '#circle' do
    let(:svg) do
      Batik::SVG.new do
        circle :cx => 10, :cy => 10, :r => 20, :fill => 'blue'
      end
    end

    it 'add new circle element' do
      svg.to_s.should match '<circle fill="blue" r="20" cx="10" cy="10"/>'
    end
  end

  describe '#text' do
    let(:svg) do
      Batik::SVG.new do
        text :x => 10, :y => 10, :body => 'SVG random text'
      end
    end

    it 'add new text element' do
      svg.to_s.should match '<text x="10" y="10">SVG random text</text>'
    end
  end

  describe '#path' do
    let(:svg) do
      Batik::SVG.new do
        path :d => 'M 100 100 L 300 100 L 200 300 z', :fill => 'red', :stroke => 'blue'
      end
    end

    it 'add new path element' do
      svg.to_s.should match '<path fill="red" d="M 100 100 L 300 100 L 200 300 z" stroke="blue"/>'
    end
  end

  describe '#ellipse' do
    let(:svg) do
      Batik::SVG.new do
        ellipse :cx => 100, :cy => 100, :rx => 50, :ry => 20
      end
    end

    it 'add new ellipse element' do
      svg.to_s.should match '<ellipse rx="50" ry="20" cx="100" cy="100"/>'
    end
  end

  describe '#polygon' do
    let(:svg) do
      Batik::SVG.new do
        polygon :points => '0,20 20,0 40, 20', :fill => 'blue'
      end
    end

    it 'add new ellipse element' do
      svg.to_s.should match '<polygon fill="blue" points="0,20 20,0 40, 20"/>'
    end
  end
end

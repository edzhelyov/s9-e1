require 'spec_helper'

describe 'Batik::SVG with block interface' do
  describe '#rectangle' do
    let(:svg) { Batik::SVG.new }

    it 'add new rect element' do
      svg.rectangle do
        coordinates 10, 20
        dimensions 20, 30
        color :fill => 'red'
      end
      svg.to_s.should match '<rect fill="red" x="10" width="20" height="30" y="20"/>'
    end
  end

  describe 'pending features' do
    it 'transform' do
      pending 'test transformations'
    end

    it 'only one coordinate' do
      pending 'Decide what to do for coordinates 10, etc'
    end

  end

  describe '#circle' do
    let(:svg) do
      Batik::SVG.new do
        circle do
          coordinates 10, 10
          radius 20
          color :fill => 'blue'
        end
      end
    end

    it 'add new circle element' do
      svg.to_s.should match '<circle fill="blue" r="20" cx="10" cy="10"/>'
    end
  end

  describe '#text' do
    let(:svg) do
      Batik::SVG.new do
        text do
          coordinates 10, 10
          body 'SVG random text'
        end
      end
    end

    it 'add new text element' do
      svg.to_s.should match '<text x="10" y="10">SVG random text</text>'
    end
  end

  describe '#path' do
    let(:svg) do
      Batik::SVG.new do
        path do
          move 100, 100
          line 300, 100
          line 200, 300
          close
          color :fill => 'red', :stroke => 'blue'
        end
      end
    end

    it 'add new path element' do
      svg.to_s.should match '<path fill="red" d="M 100 100 L 300 100 L 200 300 Z " stroke="blue"/>'
    end
  end
end

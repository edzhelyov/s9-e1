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
end

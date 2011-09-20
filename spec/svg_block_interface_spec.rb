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
end

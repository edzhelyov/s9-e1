require 'spec_helper'

describe 'Batik::SVG with block interface' do
  describe '#rectangle' do
    let(:svg) { Batik::SVG.new }

    it 'add new rect element' do
      svg.rectangle
      svg.to_s.should match '<rect width="20" x="10" fill="red" height="30" y="20"/>'
    end
  end
end

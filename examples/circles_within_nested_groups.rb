require 'batik'

svg = Batik::SVG.new(width: 400, height: 400) do
  group :fill => 'red' do
    circle :cx => 100, :cy => 100, :r => 50
    group :stroke => 'black', 'stroke-width' => 15 do
      circle :cx => 200, :cy => 200, :r => 30
      group :fill => 'blue' do
        circle :cx => 300, :cy => 300, :r => 40
      end
    end
  end
end

File.open('circles_within_nested_groups.svg', 'w+') do |file|
  file << svg.to_s
end

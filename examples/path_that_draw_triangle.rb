require 'batik'

svg = Batik::SVG.new(width: 400, height: 400) do
  path :d => 'M 100 100 L 300 100 L 200 300 z', :fill => 'red', :stroke => 'blue', 'stroke-width' => 3
end

File.open('path_that_draw_triangle.svg', 'w+') do |file|
  file << svg.to_s
end

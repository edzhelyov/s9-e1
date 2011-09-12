require 'batik'

svg = Batik::SVG.new(width: 200, height: 200) do
  rectangle x: 10, y: 10, width: 180, height: 180, fill: 'cyan'
  circle cx: 10, cy: 20, r: 5, fill: 'black'
  circle cx: 10, cy: 170, r: 5, fill: 'black'
end

File.open('rectangle_with_two_circles.svg', 'w+') do |file|
  file << svg.to_s
end

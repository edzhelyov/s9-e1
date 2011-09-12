require 'batik'

svg = Batik::SVG.new(width: 200, height: 200) do
  rectangle :x => 0, :y => 0, :width => 200, :height => 200, :fill => 'white', :stroke => 'blue', 'stroke-width' => 10
  text :x => 20, :y => 100, 'font-family' => 'Verdana', 'font-size' => 15, :fill => 'red', :body => 'Text within rectangle'
end

File.open('rectangle_with_text.svg', 'w+') do |file|
  file << svg.to_s
end

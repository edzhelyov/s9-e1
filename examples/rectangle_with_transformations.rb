require_relative '../lib/batik'

Batik::SVG.draw('rectangle_with_transofrmations.svg', width: 400, height: 400) do
  group do
    translate 200, 200
    rotate 30
    scale 2, 5
    
    rectangle do
      coordinates 0, 0
      dimensions 50, 30
    end
  end
end

tableOfContents = [["Chapter 1:  Numbers", "Page 1"],["Chapter 2:   Letters", "Page 72"], ["Chapter 3:   Variables", "Page 118"]]

lineWidth = 40

puts "Table of Contents".center(lineWidth)
tableOfContents.each do |chapter|
    puts chapter[0] + chapter[1].rjust(lineWidth)
end

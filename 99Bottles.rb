beer = 99
while (beer != 0)
    puts "There\'s " + beer.to_s + " bottles of beer on the wall, " + beer.to_s + " bottles of beer."
    puts "Take one down, pass it around"
    beer -= 1
    puts beer.to_s + " bottles of beer on the wall!"
end
puts "No more beer? Shucks"
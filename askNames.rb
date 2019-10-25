puts "What is your first name?"
firstName = gets.chomp
puts "Nice! What's your middle name?"
middleName = gets.chomp
puts "Mine too! What's your last name?"
lastName = gets.chomp
puts "Good ta meet ya, " + firstName + " " + middleName + " " + lastName + "!"
puts "What is your favorite number?"
favoriteNumber = gets.chomp
biggerNumber = favoriteNumber.to_i + 1
puts favoriteNumber + "? That's okay, I guess, but what about #{biggerNumber}? It's even bigger!"

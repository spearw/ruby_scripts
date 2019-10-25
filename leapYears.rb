puts "This is leap years, your all inclusive leap year knowledge pack."
puts "Enter a starting year"
year = gets.chomp.to_i
puts "Enter an ending year"
endingYear = gets.chomp.to_i

while year <= endingYear
    if (year%4 == 0 and year%100 != 0 or year%400 == 0)
        puts year
        year += 1
    else
        year += 1
    end
end
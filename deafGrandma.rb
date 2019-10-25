puts "Your grandma is sitting peacefully on a rocking chair."
puts "What will you say to her?"
answer = ""
byeCount = 0

while byeCount < 3
    puts "byecount = " + byeCount.to_s
    answer = gets.chomp
    if (answer != answer.upcase or answer = "BYE")
        puts "HUH?! SPEAK UP, SONNY!"
        if answer != "BYE"
            byeCount = 0
        else
            byeCount += 1
        end
    else
        puts "NO, NOT SINCE " + (1930 + rand(21)).to_s + "!"
        byeCount = 0
    end
end
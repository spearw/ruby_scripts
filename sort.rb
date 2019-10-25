word = "starter"
wordList = []
while word != ""
    word = gets.chomp
    wordList.push word
end

wordList = wordList.sort
wordList.each do |word|
    puts word
end
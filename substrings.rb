def substrings (string, dictionary)
    word_count = {}
    string.downcase!
    dictionary.each do |word|
        #puts word
        if string.include?(word)
            word_count[word] = string.scan(word).count
        end


    end
    word_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
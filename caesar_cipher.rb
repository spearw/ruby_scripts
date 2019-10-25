def caesar_cipher (string, key)
    output = ""
    string.each_char do |letter|
        letter = letter.ord
        if (65..90) === letter
            letter = 65 + ((letter + key) % 26)
        elsif (97..122) === letter
            letter = 97 + ((letter + key) % 26)
        end
        output << letter.chr
    end
    output
end

puts caesar_cipher("What a string!", 5)
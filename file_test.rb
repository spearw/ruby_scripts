
#copies wiki homepage to computer
require 'rubygems'
require 'rest-client'
wiki_url = "http://en.wikipedia.org/"
wiki_local_filename = "wiki-page.html"

File.open(wiki_local_filename, "w") do |file|
    file.write(RestClient.get(wiki_url))
end



#write internet file onto driv
require 'open-uri'
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
local_fname = "hamlet.txt"
File.open(local_fname, 'w'){|file| file.write(open(url).read)}


#prints out every 42nd line of Hamlet
puts 'every 42nd line'
puts ''
puts ''
File.open(local_fname, 'r') do |file|
    file.readlines.each_with_index do |line, i|
        if i % 42 == 41
            puts line
        end
    end
end

#prints every line said by Hamlet
puts 'Every line by Hamlet'
puts ''
puts ''

hamlet_speaking = false
File.open(local_fname, 'r') do |file|
    file.readlines.each do |line|

        if hamlet_speaking == true && (line.match(/^  [A-Z]/) || line.strip.empty?)
            hamlet_speaking = false
        end

        hamlet_speaking = true if line.match(/^  Ham\./)

        puts line if hamlet_speaking == true
    end
end

#listing items in directory
#changing directory to route - easy way to find directory is to 'get info', and then copy the 'where' info 
Dir.chdir("/Users/williamspear")
#listing from current directory
puts Dir.glob("*")
#listing from specific directory path
puts Dir.glob('Downloads/*')


#lists 10 largest files in given directory
DIRNAME = "Downloads"
Dir.glob("#{DIRNAME}/**/*.*").sort_by{|fname| File.size(fname)}.reverse[0..9].each do |fname|
    puts "#{fname}\t#{File.size(fname)}"
end

#better format for last event
hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
    ext = File.basename(fname).split('.')[-1].to_s.downcase
    hsh[ext] ||= [0,0]
    hsh[ext][0] += 1
    hsh[ext][1] += File.size(fname)
    hsh
end

File.open("file-analysis.txt", "w") do |f|
    hash.each do |arr|
      txt = arr.flatten.join("\t")
       f.puts txt
       puts txt
    end
 end
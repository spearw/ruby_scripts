class OrangeTree

    def initialize
        @numberOfOranges = 0
        @height = 0
        @age = 0
        @treeAlive = true
        puts "You plant an orange tree in the soil"
    end

    def countTheOranges
        if @numberOfOranges == 0
            puts "There are no oranges. Is the tree not producing, or did you just eat them all?"
        else
            puts "There are #{@numberOfOranges} oranges in the tree."
        end
    end

    def pickAnOrange
        if @numberOfOranges > 0
            @numberOfOranges = @numberOfOranges - 1
            puts "You picked an orange. It was delicious!"
        else
            puts "There are no oranges..."
        end
    end

    def height
        puts "Your orange tree is #{@height} inches tall"
    end

    def oneYearPasses
        @age = @age + 1
        @height = @height + (6 + rand(6))
        if @height > 48
            @numberOfOranges = (@height/6) + rand(6)
        end
        if @age > 10
           puts "When you return in the spring, your tree has died. Perhaps it will still nuture new life"
           exit
        else
            @treeAlive = false
            puts "A year passes. Your tree is bigger each year!"
        end
    end

    def methodDispatch(input)
        if input == 'counttheoranges'
            countTheOranges
        elsif input == 'pickanorange'
            pickAnOrange
        elsif input == 'height'
            height
        elsif input == 'oneyearpasses'
            oneYearPasses
        else
            puts "Invalid command. Please enter 'counttheoranges', 'pickanorange', height', or 'oneyearpasses'"
        end
    end
end

tree = OrangeTree.new
while TRUE do
    input = gets.chomp.downcase
    tree.methodDispatch(input)
end
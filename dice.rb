class Die

    def initialize
      # I'll just roll the die, though we
      # could do something else if we wanted
      # to, like setting the die with 6 showing.
      roll
    end
  
    def roll
      @numberShowing = 1 + rand(6)
    end
  
    def showing
      @numberShowing
    end

    def cheat(int)
        if int < 7 and int > 0
            @numberShowing = int
        else
            "Out of bounds of die - put number between 1-6"
        end
    end
  
  end

die = Die.new
puts die.roll
puts die.cheat(7)
puts die.cheat(0)
puts die.cheat(3)
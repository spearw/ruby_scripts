class PlayTicTacToe

    def initialize
        @game_on = true
        @player_x = false
        @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        interface
    end

    def show_board

        puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
        puts "------------"
        puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
        puts "------------"
        puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "

        
    end

    def place_piece(location, player_x)
        
        if @board[location[0]][location[1]] != " "
            puts "Space occupied. Choose a new space."
            player_turn
            return
        end
        

        if player_x == true
            @board[location[0]][location[1]] = "X"
        else
            @board[location[0]][location[1]] = "O"
        end
        
        show_board


    end

    def interface

        
        puts "Welcome to tic tac toe!"
        puts ""
        puts "X goes first."


        while @game_on
            start_turns
            player_turn
            game_over?
        end

        play_again

    end

    def play_again
        while true
            puts "Play again? (y/n)"
            answer = gets.chomp
            if answer == 'y'
                initialize
                break
            elsif answer == 'n'
                puts 'Too bad! See you next time!'
                break
            else
                puts 'Invalid command!'
            end
        end
    end

    def player_turn

        puts "Which row? (1-3)"
        row = gets.chomp.to_i
        puts "Which Column? (1-3)"
        column = gets.chomp.to_i

        if row.between?(1, 3) && column.between?(1, 3)
            puts "Playing at #{row}, #{column}"
            location = [row-1, column-1]
            place_piece(location, @player_x)
        else
            puts "Invalid Entry"
            player_turn
        end
            
    end

    def start_turns

        if @player_x
            puts "It's O's turn!"
            @player_x = false
        else
            puts "It's X's turn!"
            @player_x = true
        end


    end

    def game_over?

            #horizontal victories
        if  ((@board[0][0] == @board[0][1]) && (@board[0][0] == @board[0][2]) unless (@board[0][0] == " ")) ||
            ((@board[1][0] == @board[1][1]) && (@board[1][0] == @board[1][2]) unless (@board[1][0] == " "))||
            ((@board[2][0] == @board[2][1]) && (@board[2][0] == @board[2][2]) unless (@board[2][0] == " "))||
            #vertical victories
            ((@board[0][0] == @board[1][0]) && (@board[0][0] == @board[2][0]) unless (@board[0][0] == " ")) ||
            ((@board[0][1] == @board[1][1]) && (@board[0][1] == @board[2][1]) unless (@board[0][1] == " ")) ||
            ((@board[0][2] == @board[1][2]) && (@board[0][2] == @board[2][2]) unless (@board[0][2] == " ")) ||
            #diagonal victories
            ((@board[0][0] == @board[1][1]) && (@board[0][0] == @board[2][2]) unless (@board[0][0] == " ")) ||
            ((@board[0][2] == @board[1][1]) && (@board[0][2] == @board[2][0]) unless (@board[0][2] == " "))

                @game_on = false
                puts 'Victory!'
        else
                return
        end


    end

end

game = PlayTicTacToe.new
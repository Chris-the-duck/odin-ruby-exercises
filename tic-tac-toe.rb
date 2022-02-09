
## FIX OUTCOME CHECK - does not recognise O winning, only X (????)
## Unify pick and change square so the turn doesn't switch to the other player on invalid input

class Game
    attr_accessor :coords, :current_player, :game_state
    def initialize(player_x, player_o)
        @player_x = player_x
        @player_o = player_o
        @coords = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
        @current_player = "X"
        @game_state = "active"
    end
    def check_outcome
        rows = [self.coords[0, 3], self.coords[3, 3], self.coords[6, 3]] 
        columns = [[self.coords[0], self.coords[3], self.coords[6]],
        [self.coords[1], self.coords[4], self.coords[7]],
        [self.coords[2], self.coords[5], self.coords[8]]]
        diags = [[self.coords[0], self.coords[4], self.coords[8]],
        [self.coords[2], self.coords[4], self.coords[6]]]
        p outcome_helper(rows)
        if outcome_helper(rows)
            puts "#{check_winner_name(outcome_helper(rows))} wins by making a row!"
            self.game_state = "ended"
        elsif outcome_helper(columns)
            puts "#{check_winner_name(outcome_helper(columns))} wins by making a column!"
            self.game_state = "ended"
        elsif outcome_helper(diags)         
            puts "#{check_winner_name(outcome_helper(diags))} wins by making a diagonal!"
            self.game_state = "ended"
        else
            if self.coords.all? { |coord| coord == "X" || coord == "O"}
                puts "It's a draw!"
                self.game_state = "ended"
            end
        end
    end

    def change_square(coord, symbol)
        unless self.coords.include?(coord)
            puts "Invalid square. Try again."
            return
        end
        idx = self.coords.index(coord)
        self.coords[idx] = symbol
    end
    def draw_game
        puts " #{self.coords[0]} | #{self.coords[1]} | #{self.coords[2]} "
        puts "-------------"
        puts " #{self.coords[3]} | #{self.coords[4]} | #{self.coords[5]} "
        puts "-------------"
        puts " #{self.coords[6]} | #{self.coords[7]} | #{self.coords[8]} "
    end
    def pick
        puts "Please enter a coordinate to place your #{self.current_player}."
        coord = gets.chomp
        self.change_square(coord, "#{self.current_player}")
        self.current_player = self.current_player == "X" ? "O" : "X"
    end
    private
    def outcome_helper(arr)
        arr.each do |sub_arr|
            if sub_arr.all? { |coord| coord == "X"} || sub_arr.all? { |coord| coord == "O"}
                return sub_arr[0]
            else
                return nil
            end
        end
    end
    def check_winner_name(coord)
        return coord == "X" ? @player_x : @player_o ## I have no idea why this threw a no method error when using "self." but here we are
    end
end

def play_game
    puts "Welcome to Tic Tac Toe!"
    puts "Please enter a name for Player 1."
    player1 = gets.chomp
    puts "Please enter a name for Player 2."
    player2 = gets.chomp
    coin = rand(2)
    first = coin > 0 ? player1 : player2
    second = first == player1 ? player2 : player1
    puts "#{first} won the roll and gets to go first with X!"
    game = Game.new(first, second)
    until game.game_state == "ended"
        game.draw_game
        game.pick
        game.check_outcome
    end
end

play_game


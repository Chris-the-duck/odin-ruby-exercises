
class Game
    attr_accessor :coords, :current_player
    def initialize
        @coords = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
        @current_player = "X"
    end
    def check_outcome
        rows = [self.coords[0, 3], self.coords[3, 3], self.coords[6, 3]] 
        columns = [[self.coords[0], self.coords[3], self.coords[6]],
        [self.coords[1], self.coords[4], self.coords[7]],
        [self.coords[2], self.coords[5], self.coords[8]]]
        diags = [[self.coords[0], self.coords[4], self.coords[8]],
        [self.coords[2], self.coords[4], self.coords[6]]]
        ## WRITE ME ##
    end
    def change_square(coord, symbol)
        unless self.coords.include?(coord)
            puts "Invalid square. Try again."
            return
        end
        self.coords[coord] = symbol ## FIX THIS - THE POST THAT SAID YOU COULD DO THIS WAS A LIE ##
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
        self.change_square(coord, " #{self.current_player}")
        self.current_player = self.current_player == "X" ? "O" : "X"
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
    puts "#{first} won the roll and gets to go first with X!"
    game = Game.new
    game.draw_game
    game.pick
end

play_game


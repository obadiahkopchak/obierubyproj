#@ 1:05 PM 2-23, during attempts have the AI's duel, the game seems to read any plays made by the AI as a match
# regardless of actual selections by the AI

#rock paper scissors
puts "Welcome to Rock Paper Scissors, let us begin"


# there will be a player class, the player will have two main attributes, the ability to take an input
class Player
	attr_accessor :player_name, :player_throw, :player_wins, :player_number
	def initialize (player_number)
		@player_number = player_number
		@player_moves = []
		@player_wins = 0
		ask_name  #ask_name may need a self.ask_name instead
	end
	def ask_name
		puts "Please type your name"
		@player_name = gets.chomp.to_s
	end

	def make_move
		puts "Please type rock, paper, or scissors"
		move_made = gets.chomp.to_s.downcase
		@player_moves.push(move_made)
	end
	def show_play_history
		@player_moves.each do |moves|
			puts moves
		end
	end	
end		
#game "AI"

## general notes at 1PM, I have just commented out the .push methods that would move the "AI"'s moves into an array
## this comment fix seems to fix some of my issues, I'm not sure why
class Robot < Player
	def ask_name
		@player_name = "Robot #{@player_number}"
	end
	def make_move
		bot_move = rand(1..3)
		if bot_move ==1
			puts "rock"
		#	player_moves.push("rock")
		elsif bot_move == 2
			puts "paper"
		#	player_moves.push("paper")
		elsif bot_move ==3
			puts "scissors"
		#	player_moves.push("scissors")
		else
			puts "not sure how that happened"
		end
	end
end

class RockPaperScissorsGame
	attr_accessor :player_count, :robot_count, :player_number, :total_number_of_plays, :victory_condition
	def initialize 
		how_many_players
		@total_number_of_plays = 0
		set_victory_condition
		show_players
		two_player_game
	end
	#have starter conversation
	#puts "Welcome to Rock Paper Scissors, aka Roshambo, please indicate how many players you have (1 or 2)"
	def how_many_players
		player_count = -1
		@player_list = []
		while !( player_count <= 2 && player_count >= 0) do
			puts "Please indicate if you would like to play with 0, 1, or 2 humans"
			player_count = gets.chomp.to_i
		end
		player_count.times do |i| 
			@player_list.push(Player.new(i))
		end
		(2-player_count).times do |i|
			@player_list.push(Robot.new(i))	
		end
	end

	def set_victory_condition
		puts "Please tell me how many games you need to win for total victory"
		@victory_condition = gets.chomp.to_i
	end
	
	def show_players
		@player_list.each do |name|
			puts name
	end	
    #initially we don't care about who has won the game just that we will keep playing until the win condition is met?
	def two_player_game
		#while @player_list.any? {|x| x.player_wins >= @victory_condition} do
		#def player_scoring(a_player)
		#	a_player.player_wins
		#end
		#while (player_scoring(@player_list[0] < @victory_condition || player_scoring(@player_list[1] < @victory_condition) do
			
			def play_round
				@player_one_move = @player_list[0].make_move
				@player_two_move = @player_list[1].make_move
				if @player_one_move == @player_two_move
					#impliment tie method
					#option B is a sudden death condition
					puts "You played the same #{@player_one_move}, the round doesn't count"
					@total_number_of_plays += 0
				else
					if (@player_one_move == "rock"  && @player_two_move == "scissors") || #current turn 
						(@player_one_move == "paper"  && @player_two_move == "rock") ||
						(@player_one_move == "scissors"  && @player_two_move == "paper")
						add_to_player_score(@player_list[0])
					elsif (@player_two_move == "rock"  && @player_one_move == "scissors") || #current turn 
						(@player_two_move == "paper"  && @player_one_move == "rock") ||
						(@player_two_move == "scissors"  && @player_one_move == "paper")
						add_to_player_score(@player_list[1])
					else 
						puts "something went wrong"
						@total_number_of_plays += 1
					end
				end
				def add_to_player_score (player)
					## you will need to fix this
					player.player_wins += 1
					@total_number_of_plays += 1
				end
			end
			while @total_number_of_plays < 2 do
				play_round
		end
		#end
	end 
end
RockPaperScissorsGame.new

#the game will track the number of games played as well as the number of wins each player has
#for a two player game this will make an array with three slots [game#, player1win_count, player2win_count]		
#rock paper scissors
#it may be necessary to have a current move indicator, this will +1 every play no matter what
#so I figured out that the move indicator isn't fully necessary by accessing the -1 element of an array
#you always call up the most current addition to the array,
#I am about to grab lunch, but it appears that it would help to add an indicator that shows the tally 
#at the end of each round, this will also help with debugging,
#6:15 PM good news, the score indicator works, the game ends at the appropriate time
#what doesn't work, ai v ai or human v human, which throws a no method error, I'm not sure what causes this
#it further appears that if I attempt to set the victory condition to any value greater than 2, maybe 3 or 4
#the game busts, that bit is weird

#many of these concens have been fixed, by moving the definition for add_to_player_score out of the definition for
# play_round, don't ask me why that was critical

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
		puts "#{@player_name}, please type rock, paper, or scissors"
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
class Robot < Player
	def ask_name
		@player_name = "Robot #{@player_number}"
	end
	def make_move
		bot_move = rand(1..3)
		if bot_move ==1
			puts "#{@player_name} plays rock"
			@player_moves.push("rock")
		elsif bot_move == 2
			puts "#{@player_name} plays paper"
			@player_moves.push("paper")
		elsif bot_move ==3
			puts "#{@player_name} plays scissors"
			@player_moves.push("scissors")
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
		two_player_game
	end
	#have starter conversation
	#puts "Welcome to Rock Paper Scissors, aka Roshambo, please indicate how many players you have (1 or 2)"
	def how_many_players
		player_count = 12
		@player_list = []
		while !( player_count <= 2 && player_count >= 0) do
			puts "Please indicate if you would like to play with 0, 1, or 2 humans"
			player_count = gets.chomp.to_i
		end
		player_count.times do |i| 
			@player_list.push(Player.new(i+1))
		end
		(2-player_count).times do |i|
			@player_list.push(Robot.new(i+1))	
		end
	end

	def set_victory_condition
		puts "Please tell me how many games you need to win for total victory"
		@victory_condition = gets.chomp.to_i
	end
	def player_score(player)
		player.player_wins
	end
	#in this current version the program calls the player from a position in the player list
	def add_to_player_score (player)
	player.player_wins += 1
	@total_number_of_plays += 1
	end
	def two_player_game
		#play round is intended to help the until loop used to keep the game going, the scoring method is defined outside
		#of this section of score, this is to avoid a strange bug that limited the game to a maximum of two rounds
		def play_round
			@player_one_move = @player_list[0].make_move
			@player_two_move = @player_list[1].make_move
			if @player_one_move[-1] == @player_two_move[-1]
				puts "You both played #{@player_one_move[-1]}, the round doesn't count"
				@total_number_of_plays += 0
			else
				if ((@player_one_move[-1] == "rock"  && @player_two_move[-1] == "scissors") || #current turn 
					(@player_one_move[-1] == "paper"  && @player_two_move[-1] == "rock") ||
					(@player_one_move[-1] == "scissors"  && @player_two_move[-1] == "paper"))
					add_to_player_score(@player_list[0])
				elsif ((@player_two_move[-1] == "rock"  && @player_one_move[-1] == "scissors") || #current turn 
					(@player_two_move[-1] == "paper"  && @player_one_move[-1] == "rock") ||
					(@player_two_move[-1] == "scissors"  && @player_one_move[-1] == "paper"))
					add_to_player_score(@player_list[1])	
				else 
					puts "something went wrong"
					#for debugging 
					puts @player_one_move
					puts @player_two_move
					@total_number_of_plays +=1
				end
			end
		end
		until (player_score(@player_list[0]) >= @victory_condition || player_score(@player_list[1]) >= @victory_condition) do 
			puts "Round #{(@total_number_of_plays+1)}, FIGHT"
			play_round
			print "Player 1 has " 
			print player_score(@player_list[0])
			puts "\n"
			print "Player 2 has "
			print player_score(@player_list[1])
			puts "\n"
		end
		
	end
end
RockPaperScissorsGame.new

#the game will track the number of games played as well as the number of wins each player has
#for a two player game this will make an array with three slots [game#, player1win_count, player2win_count]		
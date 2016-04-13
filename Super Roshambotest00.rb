#Super Roshambo
#the goal of this program is to merge "rock paper scissors", and "rock paper scissors lizard spock"
#the first concern is making the "AI" compatible with both programs with relatively minimal effort
#basic rps uses rand(1..3) while rpslk uses rand(1..5)  to avoid excessive confusion there should be a method
#outside of the Robot class that defines the maximum value for the rand function this selector is @@game_ai_select		
puts "Welcome to Super Roshambo"
puts "Before we go any further, we are going to choose our game"
puts "this program has two versions of roshambo"
puts "traditional rock, paper, scissors"
puts "or"
puts "rock, paper, scissors, lizard, spock"
puts "to play normal rock paper scissors, type rock"
puts "to play rock paper scissors lizard spock type spock"
choose_game = gets.chomp.to_s.downcase
unless choose_game == "spock" 
	@@game_ai_select=3 #is equalt to either 3 or 5
	@@move_options = "rock, paper, or scissors"
else @@game_ai_select=5 #is equalt to either 3 or 5
	 @@move_options = "rock, paper, scissors, lizard, spock"
end
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
		puts "#{@player_name}, please type #{@@move_options}"
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
		bot_move = rand(1..@game_ai_select)
		if bot_move ==1
			puts "#{@player_name} plays rock"
			@player_moves.push("rock")
		elsif bot_move == 2
			puts "#{@player_name} plays paper"
			@player_moves.push("paper")
		elsif bot_move ==3
			puts "#{@player_name} plays scissors"
			@player_moves.push("scissors")
		elsif bot_move == 4
			puts "#{@player_name} plays lizard"
			@player_moves.push("paper")
		elsif bot_move ==5
			puts "#{@player_name} plays spock"
			@player_moves.push("spock")		
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

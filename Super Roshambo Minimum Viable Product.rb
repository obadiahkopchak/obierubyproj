#Super Roshambo test 02
# there will be a player class, the player will have two main attributes, the ability to take an input
class Player
	attr_accessor :player_name, :player_throw, :player_wins, :player_number
	def initialize (player_number, game_select)
		@player_number = player_number
		@game_select = game_select
		@player_moves = []
		@player_wins = 0
		ask_name  #ask_name may need a self.ask_name instead
		set_move_list
	end
	def ask_name
		puts "Please type your name"
		@player_name = gets.chomp.to_s
	end
	
	def set_move_list
		unless @game_select == 5
			@move_list = "rock, paper, scissors"
		else
			@move_list = "rock, paper, scissors, lizard, spock"
		end
	end	
	
	def make_move
		puts "#{@player_name}, please type #{@move_list}"
		move_made = gets.chomp.to_s
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
		bot_move = rand(1..@game_select)
		if bot_move == 1
			puts "#{@player_name} plays rock(1)"
			@player_moves.push("rock")
		elsif bot_move == 2
			puts "#{@player_name} plays paper(2)"
			@player_moves.push("paper")
		elsif bot_move == 3
			puts "#{@player_name} plays scissors(3)"
			@player_moves.push("scissors")
		elsif bot_move == 4
			puts "#{@player_name} plays lizard(4)"
			@player_moves.push("lizard")
		elsif bot_move == 5
			puts "#{@player_name} plays spock(5)"
			@player_moves.push("spock")
		else
			puts "not sure how that happened"
		end
	end
end

class RockPaperScissorsLizardSpock
	attr_accessor :player_count, :robot_count, :player_number, :total_number_of_plays, :victory_condition
	def initialize 
		choose_game_type
		how_many_players
		@total_number_of_plays = 0
		set_victory_condition
		two_player_game
	end

	def show_spock_rules
		puts "In rock, paper, scissors, lizard, spock the rules are as follows"
		puts "Scissors cuts Paper"
		puts "Paper covers Rock"
		puts "Rock crushes Lizard"
		puts "Lizard poisons Spock"
		puts "Spock smashes Scissors"
		puts "Scissors decapitates Lizard"
		puts "Lizard eats Paper"
		puts "Paper disproves Spock"
		puts "Spock vaporizes Rock"
		puts "(and as it always has) Rock crushes Scissors"
		puts "Dr Sheldon Cooper PhD"
	end

	def choose_game_type
		puts "Welcome to Super Roshambo"
		puts "Before we go any further, we are going to choose our game"
		puts "this program has two versions of roshambo"
		puts "traditional rock, paper, scissors"
		puts "or"
		puts "rock, paper, scissors, lizard, spock"
		puts "I assume you know the rules to rock paper scissors"
		puts "just in case, rock breaks, scissors.  Paper covers rock (who knows why that's bad)"
		puts "and scissors cut paper into little bits"
		puts "but you might not know the rules for rock, paper, scissors, lizard, spock"
		puts "if you would like an explanation type rules, otherwise type something else and keep going"
		rule_ask = gets.chomp.to_s.downcase
		if rule_ask == "rules"
			show_spock_rules
		else
			puts " "
		end
		puts "to play normal rock paper scissors, type rock"
		puts "to play rock, paper, scissors, lizard, spock, type spock"
		choose_game = gets.chomp.to_s.downcase
		if choose_game == "rock"
			@game_type = 3
		elsif choose_game == "spock"
			@game_type = 5
		else
			exit
		end
	end
	def how_many_players
		player_count = 12
		@player_list = []
		while !( player_count <= 2 && player_count >= 0) do
			puts "Please indicate if you would like to play with 0, 1, or 2 humans"
			player_count = gets.chomp.to_i
		end
		player_count.times do |i| 
			@player_list.push(Player.new(i+1, @game_type))
		end
		(2-player_count).times do |i|
			@player_list.push(Robot.new(i+1, @game_type))	
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
			puts "player two will now go"
			@player_two_move = @player_list[1].make_move
			if @player_one_move[-1] == @player_two_move[-1]
				puts "You both played #{@player_one_move[-1]}, the round doesn't count"
				@total_number_of_plays += 0
				puts "You will play the round again"
			else
				if ((@player_one_move[-1] == "rock"  && @player_two_move[-1] == "scissors") || #1
					(@player_one_move[-1] == "rock"  && @player_two_move[-1] == "lizard") ||
					(@player_one_move[-1] == "paper"  && @player_two_move[-1] == "rock") || #2
					(@player_one_move[-1] == "paper"  && @player_two_move[-1] == "spock") ||
					(@player_one_move[-1] == "scissors"  && @player_two_move[-1] == "paper") || #3
					(@player_one_move[-1] == "scissors"  && @player_two_move[-1] == "lizard") ||   
					(@player_one_move[-1] == "lizard"  && @player_two_move[-1] == "paper") || #4
					(@player_one_move[-1] == "lizard"  && @player_two_move[-1] == "spock") ||
					(@player_one_move[-1] == "spock"  && @player_two_move[-1] == "rock") || #5
					(@player_one_move[-1] == "spock" && @player_two_move[-1] == "scissors"))
					add_to_player_score(@player_list[0])
				elsif ((@player_two_move[-1] == "rock"  && @player_one_move[-1] == "scissors") || #1 
					   (@player_two_move[-1] == "rock"  && @player_one_move[-1] == "lizard") ||
					   (@player_two_move[-1] == "paper"  && @player_one_move[-1] == "rock") || #2
					   (@player_two_move[-1] == "paper"  && @player_one_move[-1] == "spock") ||
					   (@player_two_move[-1] == "scissors"  && @player_one_move[-1] == "paper") || #3
					   (@player_two_move[-1] == "scissors"  && @player_one_move[-1] == "lizard") || 
					   (@player_two_move[-1] == "lizard"  && @player_one_move[-1] == "paper") || #4
					   (@player_two_move[-1] == "lizard"  && @player_one_move[-1] == "spock") ||
					   (@player_two_move[-1] == "spock"  && @player_one_move[-1] == "rock") || #5
					   (@player_two_move[-1] == "spock"  && @player_one_move[-1] == "scissors"))
					add_to_player_score(@player_list[1])	
				else 
					puts "something went wrong"
					#for debugging 
					puts "Player 1 played"
					print @player_one_move[-1]
					puts "\n"
					puts "Player 2 played"
					print @player_two_move[-1]
					@total_number_of_plays +=1
					exit
					
				end
			end
		end
		def who_wins
			if player_score(@player_list[0]) >= @victory_condition
				puts "Player 1 WINS!!"
			elsif player_score(@player_list[1]) >= @victory_condition
				puts "Player 2 WINS!!"
			else puts  "I hope this doesn't display"
				exit
			end
		end
		until (player_score(@player_list[0]) >= @victory_condition || player_score(@player_list[1]) >= @victory_condition) do 
			puts "Round #{(@total_number_of_plays+1)}, FIGHT"
			play_round
			print "Player 1 has " 
			print player_score(@player_list[0])
			print " point(s)"
			puts "\n"
			print "Player 2 has "
			print player_score(@player_list[1])
			print " point(s)"
			puts "\n"
		end
		who_wins
	end
end
RockPaperScissorsLizardSpock.new

#the game will track the number of games played as well as the number of wins each player has
#for a two player game this will make an array with three slots [game#, player1win_count, player2win_count]		
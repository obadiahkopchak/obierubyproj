require 'rattleboatplayer'
require 'rattleboattargetboard'
class RattleBoatGame
	attr_accessor :game_name, :player_count

	def initialize
		@max_players = 1
		@board_size_min = 5
		@board_size_max = 20
		@target_boards = []
		@list_of_boat_lists = []
		@player_database = []
		ask_for_players
		create_players
		make_targets
		play_game
	end
	#show board is intended to let you check that the game is updating the right information
	def gets_x_axis
		@a = gets.chomp.to_i
		if (@a < @board_size_min) || (@a >@board_size_max)
			puts "sorry you went outside of the range #{@board_size_min} and #{@board_size_max}"
			puts "try again"
			gets_x_axis
		end
	end
	def gets_y_axis
		@b = gets.chomp.to_i
		if (@b < @board_size_min) || (@b >@board_size_max)
			puts "sorry you went outside of the range #{@board_size_min} and #{@board_size_max}"
			puts "try again"
			gets_y_axis
		end
	end
	def ask_players_for_size(play_num)
		player_counter = 1
			puts "RattleBoat is a bit different than the name brand game"
			puts "You and your opponent get to choose how large the maps are"
			puts "the smallest board should be a 5 x 5 (read we won't let it be smaller)"
			puts "the largest board can be 20 x 20"
			puts "Please type the first number, this will create the x axis"
			gets_x_axis
			puts "Now please choose the size of the y axis"
			gets_y_axis
		while player_counter <= play_num do
			@target_boards.push(TargBoard.new(player_counter, @a, @b))
			player_counter += 1
			#a not for later testing and building, this approach does succesfully 
			#build a new board for each player, but associating target boards with a 
			#given player has no solution yet
			#one idea, using a pre-made array for the overall game you can push each
			#TargBoard at a given array site
		end
	end

	def ask_for_players
		puts "Welcome to Rattle Boat, please tell me how many are playing"
		puts "this game supports between 1 and #{@max_players}"
		@num_o_players = gets.chomp.to_i
		if (@num_o_players == 1) || (@num_o_players <= @max_players)
			ask_players_for_size(@num_o_players)
		else 
			puts "You need to type a number between 1 and #{@max_players}"
			ask_for_players
		end
	end

	def create_players
		player_num_tracker = 1
		while player_num_tracker <= @num_o_players do
			@player_database.push(Player.new(player_num_tracker, @a, @b))
			player_num_tracker +=1
		end
		puts @player_database.length
	end

	def make_targets
		list_0 = [17,20,11,2,7]

		@list_of_boat_lists.push(list_0)
	end

	def did_u_hit(hit_pos, p_num)
		if @list_of_boat_lists.include?(hit_pos) == true
			@update_symb = "X"
			puts "you hit something"
			(@list_of_boat_lists(p_num)).delete(hit_pos)
		else
			@update_symb ="_"
			puts "alas you missed"
		end
	end

	def players_turn(player_number)
		puts "Player #{player_number} please make your move"
		current_player = player_number-1
		source_num = (@player_database[current_player].player_move)
		player_shot = source_num
		did_u_hit(player_shot, current_player)
		@target_boards[current_player].update_display(player_shot, @update_symb)
		@target_boards[current_player].display_board
	end

	def play_game
		while (@list_of_boat_lists(0).length) > 0 do
			players_turn(0)
		end
		if @list_of_boat_lists(0).length == 0
			puts "Congratulations!!"
		end
	end

	def players_place_boats
		who_placing = 0
		while who_placing <= @num_o_players do

		end
	end
end
RattleBoatGame.new

#As of 1700 on 6/2/2016 the game passably works
#players have 3 shots per turn and get 1 turns each, if you die before your turn
#you are not able to play, a future update will need you to make a method that updates 
#the general player lists
#as it stands the game will cleanly ignore bad player selections, what it won't do 
#is update your list of targets to eliminate those values


#challenge of the coming days, actually start adding in boats and a way to get rid of them


class TargBoard
	attr_accessor :board_owner, :board_number

	def initialize (board_owner, x_size, y_size)
		@board_owner = board_owner
		@board_display = []
		@x_axis = ["01","02","03","04","05","06","07","08","09","10","11","12","13",
		     	   "14","15","16","17","18","19","20","21","22","23","24","25","26"]
		@y_axis = "abcdefghijklmnopqrstuvwxyz"
		@a = x_size
		@b = y_size
		get_dimensions
	end

	#calc_griz, gen array and get_dimensions
	#are elements designed to generate the board that you display the game on 

	def gen_array(grid_size)
		i = 0
		while i < grid_size do
			@board_display.push(0)
			i += 1
		end
	end

	def get_dimensions
		grid_size = @a * @b
		gen_array(grid_size)
	end

	def gen_x_axis(a)
		i = 0
		print "#{@board_owner} "
		while i < a do
			print "#{@x_axis[i]} "
			i += 1
		end
		print "\n"	 
	end

	def gen_given_row(a,b,current_row)
		print "#{@y_axis[current_row]} "
		j = 0
		k = a * current_row
		while j < a do
			t = j + k
			print  "#{@board_display[t]}  "
			j += 1
		end 
		print "\n"
	end

	def all_rows(a,b)
		l = 0
		while l < @b do
			gen_given_row(@a,@b,l)
			l += 1
		end
	end

	def display_board
		gen_x_axis(@a)
		all_rows(@a,@b)
	end

	def update_display(shot_pos, symb)
		@board_display.insert((shot_pos-1), symb)
		@board_display.delete_at(shot_pos)
	end

end

class Boats
end

class Player
	attr_accessor :player_name, :player_move, :player_hits
	
	def initialize (player_number, board_dim_x, board_dim_y, total_players)
		@total_players = total_players
		@player_number = player_number
		@board_dim_x = board_dim_x
		@board_dim_y = board_dim_y
		what_is_your_name
		make_list_of_oponents
		@my_list_of_boats = []
		@firing_history = []
		make_letter_list
		hide_my_wessels
		make_target_boards
	end
	def what_is_your_name
		puts "please give us a name to represent you"
		@my_name = gets.chomp.to_s
	end

	def show_name
		@my_name
	end

	def make_list_of_oponents
		@list_of_oponents = {"kahn" => "KAHN"}
		position_count = 1
		while position_count <= @total_players do
			if position_count !=  @player_number
				pos_symbol = position_count.to_s
				@list_of_oponents[pos_symbol] = pos_symbol
			else 
				@list_of_oponents[@my_name] = @my_name
			end
			position_count += 1
		end
		if @total_players != 1
			@list_of_oponents.delete("kahn")
		end
	end

	def make_letter_list #this is for the letter sanity check, providing the bounds for where to shoot
		@y_ref = "abcdefghijklmnopqrstuvwxyz"
		max_y = @board_dim_y
		y_track = 1
		@letter_track = {"a" => "a"}
		while y_track < max_y do
			cur_letter = @y_ref[y_track]
			@letter_track[cur_letter] = cur_letter
			y_track += 1
		end
		pos_last_letter = max_y - 1
		@last_letter = @y_ref[pos_last_letter].upcase
	end

	def hide_my_wessels #this is a stopgap at somepoint other methods for the number of boats will need to be added, right now, 5 single points
		puts "Player #{@player_number} please place your vehicles "
		boat_tracker = 0
		board_size =@board_dim_x * @board_dim_y
		while boat_tracker <= 2 do
			puts "plase type a number between 1 and #{board_size}"
			boat_pos = gets.chomp.to_i #you many need to add checks to ensure players don't waste spots
			@my_list_of_boats.push(boat_pos)
			boat_tracker +=1
		end
		puts "\e[H\e[2J"
	end

	def fleet_size
		@num_o_boats = @my_list_of_boats.length
	end

	def make_target_boards
		@target_boards = []
		player_stand_in = 1
		while player_stand_in <= @total_players do
			if player_stand_in != @player_number
				@target_boards.push(TargBoard.new(player_stand_in, @board_dim_x, @board_dim_y))
			else
				@target_boards.push("please don't shoot here")
			end
			player_stand_in += 1
		end
	end
	# player_show_alph is here to let me confirm that the letter list is working
	def player_show_alph
		@letter_track.each_key{|key| puts key}
	end

	def show_my_enemies
		@list_of_oponents.each_key{|key| puts key}
	end

	def is_letter_valid(selected_move)
		if @letter_track[selected_move] != selected_move
			puts "you have chosen an unacceptable letter, try again"
			choose_letter
		end
	end

	def letter_adds_what(letter)
		if letter == "a"
		@move_choice = 0
		elsif letter == "b"
			@move_choice = 1*@board_dim_x
		elsif letter == "c"
			@move_choice = 2*@board_dim_x	
		elsif letter == "d"
			@move_choice = 3*@board_dim_x
		elsif letter == "e"
			@move_choice = 4*@board_dim_x
		elsif letter == "f"
			@move_choice = 5*@board_dim_x
		elsif letter == "g"
			@move_choice = 6*@board_dim_x
		elsif letter == "h"
			@move_choice = 7*@board_dim_x
		elsif letter == "i"
			@move_choice = 8*@board_dim_x
		elsif letter == "j"
			@move_choice = 9*@board_dim_x
		elsif letter == "k"
			@move_choice = 10*@board_dim_x
		elsif letter == "l"
			@move_choice = 11*@board_dim_x
		elsif letter == "m"
			@move_choice = 12*@board_dim_x
		elsif letter == "n"
			@move_choice = 13*@board_dim_x
		elsif letter == "o"
			@move_choice = 14*@board_dim_x
		elsif letter == "p"
			@move_choice = 15*@board_dim_x
		elsif letter == "q"
			@move_choice = 16*@board_dim_x
		elsif letter == "r"
			@move_choice = 17*@board_dim_x
		elsif letter == "s"
			@move_choice = 18*@board_dim_x
		elsif letter == "t"
			@move_choice = 19*@board_dim_x																	
		else
			puts "Somehow you broke the game or the programmer messed up"
			puts "the game should have limited you to the letters a-t"
			puts "or 20 rows maximum, if you were allowed a larger number"
			puts "please email me at okopchak@gmail.com"
			puts "the game will exit"
			exit
		end	
	end

	def choose_letter
		puts "PLease type a letter between A and #{@last_letter}"
		@sel_let = gets.chomp.to_s.downcase
		is_letter_valid(@sel_let)
		letter_adds_what(@sel_let)
	end

	def choose_number
		puts "Please type a number between 1 and #{@board_dim_x}"
		@sel_num = gets.chomp.to_i
		if (@sel_num < 1) || (@sel_num > @board_dim_x)
			puts "unfortunately you wrote a number outside of the accepted range"
			choose_number
		end
	end

	def who_to_shoot
		@list_of_oponents.each_key{|key| puts key}
		puts "choose one of the numbers on the screen"
		who_i_shot = gets.chomp.to_s
		if (@list_of_oponents[who_i_shot] == who_i_shot) && (who_i_shot != "me")
			@player_being_shot_at = who_i_shot.to_i
		else
			puts "you chose someone you can't shoot at, try again"
			who_to_shoot
		end
	end

	def player_move
		choose_letter
		choose_number
		player_output = @sel_num + @move_choice
		puts "\n"
		puts player_output
		@current_player_move = player_output.to_i
		#you will add a sanity check similar to what is in 10x10
		#battleship, this is partially the rational behind the player
		#being defined by the board size
	end

	def were_we_hit(target)
		if @my_list_of_boats.include?(target) == true
			@my_list_of_boats.delete(target)
			@conf_sym = "X"
		else
			@conf_sym = "_"
		end
	end

	def show_board(chosen_player)
		@target_boards[chosen_player].display_board
	end

	def update_targeted_board(chosen_player, shot_position, symbol)
		@target_boards[chosen_player].update_display(shot_position, symbol)
		@target_boards[chosen_player].display_board
		if symbol == "X"
			puts "Hit"
		else 
			puts "miss"
		end
	end

	def update_list_of_opponents(number)
		da_number = number.to_i
		@list_of_oponents.delete(da_number)
	end
end

class RattleBoatGame
	attr_accessor :game_name, :player_count
	def initialize
		@max_players = 4
		@board_size_min = 5
		@board_size_max = 20
		@player_database = []
		ask_for_players
		create_players
		play_game
	end
	
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
		puts "RattleBoat is a bit different than the name brand game"
		puts "You and your opponent get to choose how large the maps are"
		puts "the smallest board should be a 5 x 5 (read we won't let it be smaller)"
		puts "the largest board can be 20 x 20"
		puts "Please type the first number, this will create the x axis"
		gets_x_axis
		puts "Now please choose the size of the y axis"
		gets_y_axis
	end

	def ask_for_players
		puts "Welcome to Rattle Boat, please tell me how many are playing"
		puts "this game supports between 2 and #{@max_players}"
		@num_o_players = gets.chomp.to_i
		if (@num_o_players >= 2) && (@num_o_players <= @max_players)
			ask_players_for_size(@num_o_players)
		else 
			puts "You need to type a number between 2 and #{@max_players}"
			ask_for_players
		end
	end

	def create_players
		player_num_tracker = 1
		while player_num_tracker <= @num_o_players do
			@player_database.push(Player.new(player_num_tracker, @a, @b, @num_o_players))
			player_num_tracker +=1
		end
		puts @player_database.length
	end

	def are_they_alive(a_number, player_number)
		real_num = a_number -1
		boat_count = @player_database[real_num].fleet_size
		unless boat_count > 0
			puts "Fortunately for you player #{a_number} is dead"
			puts "please choose someone else"
			@player_database[player_number].update_list_of_opponents(a_number)
			choose_person(player_number)
		end
	end

	def persons_name(player_number)
		my_name = @player_database[player_number].show_name
		puts "#{my_name} please make your move"
	end

	def choose_person(player_number)
		puts "Please choose who you would like to shoot at"
		@player_being_shot = (@player_database[player_number].who_to_shoot)
		are_they_alive(@player_being_shot, player_number)
	end

	def players_turn(player_number)
		persons_name(player_number)
		current_player = player_number
		choose_person(player_number)
		puts "#{@player_being_shot} is the target of your wrath this turn"
		target_player_real_pos = @player_being_shot.to_i - 1
		@player_database[current_player].show_board(target_player_real_pos)
		source_num = (@player_database[current_player].player_move)
		player_shot = source_num
		the_symbol = (@player_database[target_player_real_pos].were_we_hit(player_shot))
		@player_database[current_player].update_targeted_board(target_player_real_pos, player_shot, the_symbol)
	end

	def list_living_players
		player_counter = 0
		while player_counter < @num_o_players do
			boat_count = @player_database[player_counter].fleet_size
			teh_name = @player_database[player_counter].show_name
			proper_num = player_counter + 1
			if boat_count > 0
				puts "#{teh_name}, aka Player Number #{proper_num}, is still alive"
			end
			player_counter += 1	
		end
	end

	def are_u_alive(player_number)
		teh_name = @player_database[player_number].show_name
		boat_count = @player_database[player_number].fleet_size
		if boat_count > 0
			list_living_players 
			players_turn(player_number)
			players_turn(player_number)
			players_turn(player_number)
		else
			puts "#{teh_name} you're like super dead"
		end
	end

	def play_game
		counter = 0
		while counter < @num_o_players do
			puts "\e[H\e[2J"
			are_u_alive(counter)
			counter += 1
		end
		puts "hopefully you got here Obie"
	end

end

RattleBoatGame.new

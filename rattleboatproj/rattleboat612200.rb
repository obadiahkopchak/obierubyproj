
#long term thoughts on how the game checks for various targets and what not
#players are already associated with a given display board
#in this version of the game, the game effectively owns everything
#a player's number defines the position in the data base arrays
#ex player 1 has their TargBoard in position 0 of the @targ_boards array
#player 1's list of vessels will be in position 0 of the @list_of_boat_lists

#the position of boats might be defined by hashes of the vessels
#name with the associated value to the hash being an array listing the 
#numbers representing the given boat's coordinates

#the variable max_players in the class RattleBoatGame can easily be changed
#this will require some thinking on how players are allowed to shoot at opponents
# one thought, players with a full compliment of ships get n shots per turn that
#could be used on how ever many players they want to 

#the current strategy is to have players only produce a number as their means of firing
#the intent is to reduce the complexity of the hit check 

#as of 5 31 I am intending to have individual players host their list of boats, additionally
#players will most likely need to host all of their targetting displays, originally
#I was intending to to have the targeting displays owned by the board, there are some
#tradeoffs, if the board owns the target lists, it will either be very complicated
# to ensure each player can access the necessary boards, or relatively simple
#but it means that players are sharing targeting information not sure which I prefer

class Player
	
	attr_accessor :player_name, :player_move, :player_hits
	
	def initialize (player_number, board_dim_x, board_dim_y, total_players)
		@total_players = total_players
		@player_number = player_number
		@board_dim_x = board_dim_x
		@board_dim_y = board_dim_y
		@my_list_of_boats = []
		@firing_history = []
		make_letter_list
		hide_my_wessels
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
		boat_tracker = 0
		board_size =@board_dim_x * @board_dim_y
		while boat_tracker <= 4 do
			puts "plase type a number between 1 and #{board_size}"
			boat_pos = gets.chomp.to_i
			@my_list_of_boats.push(boat_pos)
			boat_tracker +=1
		end
	end

	# player_show_alph is here to let me confirm that the letter list is working
	def player_show_alph
		@letter_track.each_key{|key| puts key}
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

	def player_move
		choose_letter
		choose_number
		player_output = @sel_num + @move_choice
		puts "\n"
		puts player_output
		@current_player_move = player_output
		#you will add a sanity check similar to what is in 10x10
		#battleship, this is partially the rational behind the player
		#being defined by the board size
	end

end

class NotARealPerson < Player
	#NotARealPerson is effectively the game's punching bag
	#there is just the player shooting at targets

end

class TargBoard
	attr_accessor :board_owner, :board_number

	def initialize (board_owner, x_size, y_size)
		@board_display = []
		@x_axis = ["01","02","03","04","05","06","07","08","09","10","11","12","13",
		     	   "14","15","16","17","18","19","20","21","22","23","24","25","26"]
		@y_axis = "abcdefghijklmnopqrstuvwxyz"
		@a = x_size
		@b = y_size
		get_dimensions
		display_board
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
		print "0 "
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
#			if @num_o_players != 1 do
				@player_database.push(Player.new(player_num_tracker, @a, @b, @num_o_players))
				player_num_tracker +=1
#			else 
#				@player_database.push(Player.new(player_num_tracker, @a, @b, @num_o_players))
#				@player_database.push(NotARealPerson.new(1.1, @a, @b, @num_o_players))
#			end
		end
		puts @player_database.length
	end

	def make_targets
#		@list_of_boat_lists.push(17)
#		@list_of_boat_lists.push(20)
#		@list_of_boat_lists.push(11)
		@list_of_boat_lists.push(2)
#		@list_of_boat_lists.push(7)
	end

	def did_u_hit(hit_pos)
		if @list_of_boat_lists.include?(hit_pos) == true
			@update_symb = "X"
			puts "you hit something"
			@list_of_boat_lists.delete(hit_pos)
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
		did_u_hit(player_shot)
		@target_boards[current_player].update_display(player_shot, @update_symb)
		@target_boards[current_player].display_board
	end

	def play_game
		while @list_of_boat_lists.length > 0 do
			players_turn(0)
	#		players_turn(1)  
	# most likely a nested while loop will provide us with the flexibility for all of the players
	# this will most likely require a way to eliminate players fromthe list
	#think a method is_player_dead(player_number)
		end
		if @list_of_boat_lists.length == 0
			puts "Congratulations!!"
		end
	end

end
RattleBoatGame.new

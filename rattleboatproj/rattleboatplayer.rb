class Player
	
	attr_accessor :player_name, :player_move, :player_hits
	
	def initialize (player_number, board_dim_x, board_dim_y)
		@player_number = player_number
		@board_dim_x = board_dim_x
		@board_dim_y = board_dim_y
		@firing_history = []
		make_letter_list
	end

	def make_letter_list
		@y_ref = "abcdefghijklmnopqrstuvwxyz"
		max_y = @board_dim_y
		y_track = 1
		@letter_track = {"a" => "a"}
		while y_track < max_y do
			cur_letter = @y_ref[y_track]
			@letter_track[cur_letter] = cur_letter
			y_track += 1
		end
	end

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
		@sel_let = gets.chomp.to_s
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
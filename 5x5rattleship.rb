#for the first version of this game, you are going to use a hash list 
#said hash list is used to define where your targets are
# if your hit selection equates to a hit
#the board position will get updated
#and a secondary hash list of used moves will also be updated

@refer = [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5]
@board = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
@warboardtemp = []
@xaxis = [1,2,3,4,5]
@yaxis = ["a","b","c","d","e"]
@move_list = {"Captain Piccard" => "Captain Kirk"}
@hit_list = {"Worf" => "House Martak"}
@targ_list_1 = {"a1" => "a1", "a2" => "a2", "a3" => "a3", "a4" => "a4", "e5" => "e5"}
@targ_list_2 = {"a1" => "a1", "b2" => "b2", "c3" => "c3", "d4" => "d4"}
@targ_list_3 = {"a2" => "a2", "b1" => "b1", "b3" => "b3", "d1" => "d1", "e1" => "e1"}
@targ_list_4 = {"c1" => "c1", "d1" => "d1", "b4" => "b4", "c4" => "c4"}
@targ_list_5 = {"c1" => "c1", "d1" => "d1", "b4" => "b4", "c4" => "c4", "a1" => "a1"}
def game_random
	@board_select = rand(1..5)
	if @board_select == 1
		@targ_list = @targ_list_1
	elsif @board_select == 2
		@targ_list = @targ_list_2
	elsif @board_select == 3
		@targ_list = @targ_list_3
	elsif @board_select == 4
		@targ_list = @targ_list_4
	elsif @board_select == 5
		@targ_list = @targ_list_5		
	else 
	puts "the game broke"
	exit
	end	
end
def display_board
	puts            " 0 #{@xaxis[0]} #{@xaxis[1]} #{@xaxis[2]} #{@xaxis[3]} #{@xaxis[4]}"
	puts " #{@yaxis[0]} #{@board[0]} #{@board[1]} #{@board[2]} #{@board[3]} #{@board[4]}"
	puts " #{@yaxis[1]} #{@board[5]} #{@board[6]} #{@board[7]} #{@board[8]} #{@board[9]}"
	puts " #{@yaxis[2]} #{@board[10]} #{@board[11]} #{@board[12]} #{@board[13]} #{@board[14]}"
	puts " #{@yaxis[3]} #{@board[15]} #{@board[16]} #{@board[17]} #{@board[18]} #{@board[19]}"
	puts " #{@yaxis[4]} #{@board[20]} #{@board[21]} #{@board[22]} #{@board[23]} #{@board[24]}"
end

def hit_check(thing)

	if ((@targ_list[thing] == thing) || (@hit_list[thing] == thing))
		puts "hit"
		@hit_list[thing] = thing
		@board.insert((@move_choice-1), "X")
		@board.delete_at(@move_choice)
		@targ_list.delete(thing)
		display_board
	elsif @targ_list[thing] != thing
		@move_list[thing] = thing
		puts "miss"
		@board.insert((@move_choice-1), "_")
		@board.delete_at(@move_choice)
		display_board
	else
		puts "try again sexy"
	end
end

def valid_letter(letter)
	if letter == "a"
		@move_choice = 0
	elsif letter == "b"
		@move_choice = 5
	elsif letter == "c"
		@move_choice = 10	
	elsif letter == "d"
		@move_choice = 15
	elsif letter == "e"
		@move_choice = 20
	else
		puts "Alas you made an illigal move, try again"
		choose_letter
	end	
end

def choose_letter
	puts "Please select one of the rows to target (choose a letter)" #think about moves
	@move_choice_sym = gets.chomp.to_s.downcase

	valid_letter(@move_choice_sym)
end

def choose_number
	puts "Please select a column to bombard (choose a number)"
		@move_choice_num = gets.chomp.to_i
	
	if @move_choice_num <= 0 || @move_choice_num >= 6
		puts "you used a number that wasn't 1,2,3, 4, or 5.  Try again"
		choose_number
	end
end

def current_move(number)
	@move_choice += number
end

def player_move
	choose_letter
	choose_number

	move_choice_num_string = @move_choice_num.to_s
	move_hash = @move_choice_sym + move_choice_num_string

	current_move(@move_choice_num)

	if (@move_choice >= 1 && @move_choice <=25)
		hit_check(move_hash)

	elsif (@move_choice <= 0 || @move_choice >=26)
		puts "That move isn't allowed, please choose another"
		player_move
	end
end

def start_rattle_ship
	game_random
	puts "#{@board_select}" #for debugging
	num_o_targets = @targ_list.length
	puts "welcome to rattle ship, there are #{num_o_targets} enemy targets"
	display_board 
	while @targ_list.length > 0 do 
		if @targ_list.length >1 
			puts "there are #{@targ_list.length} targets left"
		else
			puts "One target left, you are so close"
		end	
		player_move
	end
	if @targ_list.length == 0
		puts "You WIN!"
	end
end

start_rattle_ship
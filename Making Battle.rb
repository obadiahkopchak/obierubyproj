#for the first version of this game, you are going to use a hash list 
#said hash list is used to define where your targets are
# if your hit selection equates to a hit
#the board position will get updated
#and a secondary hash list of used moves will also be updated

@refer = [1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6]
@board = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
@warboardtemp = []
@xaxis = [1,2,3,4]
@yaxis = ["a","b","c","d"]
@move_list = {"100" => "100"}
@targ_list = {"a1" => "a1", "b2" => "b2", "c3" => "c3"}

def calc_mov_choice(yval,xval)
	if yval == "a"
		@move_choice = 0 + xval
	elsif yval == "b"
		@move_choice = 4 + xval
	elsif yval == "c"
		@move_choice = 8 + xval
	elsif yval == "d"
		@move_choice = 12 + xval
	else
		puts "how did that happen?"
	end
end

def display_board
	puts            " 0 #{@xaxis[0]} #{@xaxis[1]} #{@xaxis[2]} #{@xaxis[3]}"
	puts " #{@yaxis[0]} #{@board[0]} #{@board[1]} #{@board[2]} #{@board[3]}"
	puts " #{@yaxis[1]} #{@board[4]} #{@board[5]} #{@board[6]} #{@board[7]}"
	puts " #{@yaxis[2]} #{@board[8]} #{@board[9]} #{@board[10]} #{@board[11]}"
	puts " #{@yaxis[3]} #{@board[12]} #{@board[13]} #{@board[14]} #{@board[15]}"
end

def hit_check(thing)
	if @targ_list[thing] != thing
		@move_list[thing] = thing
		puts "miss"
		@board.insert((@move_choice-1), "_")
		@board.delete_at(@move_choice)
		display_board
	elsif @targ_list[thing] ==thing
		puts "hit"
		@board.insert((@move_choice-1), "X")
		@board.delete_at(@move_choice)
		display_board
	else
		puts "try again sexy"
	end
end


def player_move
	puts "Please select one of the rows to target" #think about moves
	move_choice_sym = gets.chomp.to_s
	puts "Please select a column to bombard"
	move_choice_num = gets.chomp.to_i

	move_choice_num_string = move_choice_num.to_s
	move_hash = move_choice_sym+move_choice_num_string

	calc_mov_choice(move_choice_sym, move_choice_num)
	if (@move_choice >= 1 && @move_choice <=16)
		hit_check(move_hash)

	elsif (@move_choice <= 1 || @move_choice >=16)
		puts "That move isn't allowed, please choose another"
		player_move
	else 
		puts "this shouldn't happen"
		exit
	end
end

display_board
player_move
player_move
player_move

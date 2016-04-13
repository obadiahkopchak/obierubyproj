#this version of ric rac ro, has no means of preventing users from choosing
#values less than 1 and 9, this can cause several issues, it also
#does not limit players to only making new moves

@game_board = [1,2,3,4,5,6,7,8,9]
def lookatboard
	puts "_#{@game_board[0]}_|_#{@game_board[1]}_|_#{@game_board[2]}_"
	puts "_#{@game_board[3]}_|_#{@game_board[4]}_|_#{@game_board[5]}_"
	puts " #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]} "
end
	lookatboard
def check_player(number)
	print = @game_board[number]
end
def win_output(number)
	puts "#{check_player(number)} Wins"
	exit
end
def win_check
	if (@game_board[0]==@game_board[1]) && (@game_board[1]==@game_board[2])
		win_output(0)
	elsif (@game_board[3]==@game_board[4]) && (@game_board[4]==@game_board[5])
		win_output(3)
	elsif (@game_board[6]==@game_board[7]) && (@game_board[7]==@game_board[8])
		win_output(6)
	elsif (@game_board[0]==@game_board[3]) && (@game_board[3]==@game_board[6])
		win_output(0)
	elsif (@game_board[1]==@game_board[4]) && (@game_board[4]==@game_board[7])
		win_output(1)
	elsif (@game_board[2]==@game_board[5]) && (@game_board[5]==@game_board[8])
		win_output(2)
	elsif (@game_board[0]==@game_board[4]) && (@game_board[4]==@game_board[8])
		win_output(0)
	elsif (@game_board[2]==@game_board[4]) && (@game_board[4]==@game_board[6])
		win_output(2)		
	else
		puts "keep playing"
	end
end	
def player_move(symbol)
	puts "Player #{symbol} please select one of the availablle moves " #think about moves
	move_choice = gets.chomp.to_i
	@game_board.insert((move_choice-1), "#{symbol}")
	@game_board.delete_at(move_choice)
	lookatboard
end
def play_game
	move_count = 0
		while move_count <= 5 do
		player_move("X")
		win_check
		player_move("O")
		win_check
		move_count += 1
	end
end
play_game



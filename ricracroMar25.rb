class Player
	attr_accessor :player_name, :player_move
	def initialize (player_number)
		@player_number = player_number
		ask_name
		set_symbol
	end
	def ask_name
		puts "Please type your name"
		@player_name = gets.chomp.to_s
	end
	def set_symbol
		if player_number%2 == 0
			@player_symbol = O
		else
			@player_symbol = X
		end
	end
	def make_move
		puts "#{@player_symbol} (otherwise known as #{@player_name}) please move"
		move_made = gets.chomp.to_i
	end

end
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
	def player_move_x
		puts "Player X please select one of the availablle moves " #think about moves
		move_choice = gets.chomp.to_i
		@game_board.insert((move_choice-1), 'x')
		@game_board.delete_at(move_choice)
		lookatboard
	end
	def player_move_o
		puts "Player O please select one of the availablle moves " #think about moves
		move_choice = gets.chomp.to_i
		@game_board.insert((move_choice-1), 'o')
		@game_board.delete_at(move_choice)
		lookatboard
	end
def play_game
	move_count = 0
		while move_count <= 5 do
		player_move_x
		win_check
		player_move_o
		win_check
		move_count += 1
	end
end
play_game

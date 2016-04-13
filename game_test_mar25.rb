#game test
#class RicRac
	#attr_accessor :panda
	#def initialize
	@game_board = [1,2,3,4,5,6,7,8,9]
	#vs
	#game_board_hash = {"1" => 1, "2" => 2, "3" => 3, "4" => 4, "4" => 5,
	#				   "6" => 6, "7" => 7, "8" => 8, "9" => 9}
	#end
	#show_board

	def lookatboard
		puts "_#{@game_board[0]}_|_#{@game_board[1]}_|_#{@game_board[2]}_"
		#puts "___|___|___"
		puts "_#{@game_board[3]}_|_#{@game_board[4]}_|_#{@game_board[5]}_"
		#puts "___|___|___"
		puts " #{@game_board[6]} | #{@game_board[7]} | #{@game_board[8]} "

		#puts "   |   |   " #this is to even out the board
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
	player_move_x # round 1
	player_move_o #
	player_move_x # round 2
	player_move_o
	player_move_x # round 3
	win_check
	player_move_o
	win_check
	player_move_x # round 4
	win_check
	player_move_o
	win_check

#end
#RicRac.new

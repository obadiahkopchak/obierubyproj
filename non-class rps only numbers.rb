#debug worked at 1:11 pm 2 21, player_one_move and player two move were hard coded
#worked at 1:25 when all of the moves were reworked as integers, 1,2,3
#it seems to get confused when I try to display a word to go along with the "AI's" selection
#2/23/2016 12:46 version including translator seems to work, I am about to try a 3 round play limit
#update, 3 round play seems to work
play_count = 0
puts "Welcome to Rock Paper Scissors, let us begin"
while play_count < 3 do
	puts "please type rock(1) paper(2) or scissors(3)"
	player_one_move= gets.chomp.to_i
	def translate_play(p_one)
		if p_one == 1
			puts "rock"
		elsif p_one == 2
			puts "paper"
		elsif p_one ==3
			puts "scissors"
		else
			puts "not sure how that happened"
		end
	end
	translate_play(player_one_move)
	player_two_move = rand(1..3)
	def robot_moves(player_two_move)
			if player_two_move ==1
				puts "rock"
			elsif player_two_move == 2
				puts "paper"
			elsif player_two_move ==3
				puts "scissors"
			else
				puts "not sure how that happened"
			end
	end
	#player_throw is the variable that represents the playe's choice
	#robot_moves
	robot_moves(player_two_move)
	if player_one_move == player_two_move
		#impliment tie method
		#option B is a sudden death condition
		puts "You both played #{player_one_move}, the round doesn't count"
		play_count += 0
	else
		if (player_one_move == 1  && player_two_move == 3) || #current turn 
			(player_one_move == 2  && player_two_move == 1) ||
			(player_one_move == 3  && player_two_move == 2)
			puts "player 1 wins"
			play_count +=1

		elsif (player_two_move == 1  && player_one_move == 3) || #current turn 
			(player_two_move == 2  && player_one_move == 1) ||
			(player_two_move == 3  && player_one_move == 2)
			puts "player 2 wins"	
			play_count +=1 
		else 
			puts "something went wrong"
		end
	end
end


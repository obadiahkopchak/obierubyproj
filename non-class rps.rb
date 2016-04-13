#debug worked at 1:11 pm 2 21, player_one_move and player two move were hard coded

puts "Welcome to Rock Paper Scissors, let us begin"
puts "please type rock paper or scissors"
player_one_move= gets.chomp.to_s

def robot_moves
	bot_move = rand(1..3)
		if bot_move ==1
			john_cena = "rock"
		elsif bot_move == 2
			john_cena = "paper"
		elsif bot_move ==3
			john_cena = "scissors"
		else
			puts "not sure how that happened"
		end
end
#player_throw is the variable that represents the playe's choice
robot_moves
player_two_move = john_cena
if player_one_move == player_two_move
	#impliment tie method
	#option B is a sudden death condition
	puts "You both played #{player_one_move}, the round doesn't count"
	
else
	if (player_one_move == "rock"  && player_two_move == "scissors") || #current turn 
		(player_one_move == "paper"  && player_two_move == "rock") ||
		(player_one_move == "scissors"  && player_two_move == "paper")
		puts "player 1 wins"
	elsif (player_two_move == "rock"  && player_one_move == "scissors") || #current turn 
		(player_two_move == "paper"  && player_one_move == "rock") ||
		(player_two_move == "scissors"  && player_one_move == "paper")
		puts "player 2 wins"	
	else 
		puts "something went wrong"
	end
end


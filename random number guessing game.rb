
#random number guessing game
guess_counter = 0
puts "Welcome to the Number Guessing Game"
puts "Please enter a whole number to limit what range you need to guess"
guess_range = gets.chomp.to_i
number_to_guess = rand(1..guess_range)
puts "This program has chosen a number"
puts "This number is between 1 and #{guess_range}"
#for debugging 
puts "#{number_to_guess}"
#this section is from 
#http://ruby.about.com/od/beginningruby/ss/Worked-Example-Number-Guessing-Game.htm
#while guess_counter < 5
#	puts "Please choose a random number in the range"
#	player_input = gets.chomp.to_i
#	if player_input
loop do
	puts "Please type a number to guess"
	player_input = gets.chomp.to_i
	guess_counter += 1

	unless player_input == number_to_guess
		message_to_player = if player_input > number_to_guess
		 	"Too High"
		else
			"Too Low"
		end
		puts message_to_player
	else
		puts "Congratulations this took #{guess_counter} guesses"
		exit
		end
end





#while guess_counter < 5
#	puts "please guess a number"
#	player_input = gets.chomp.to_i
#	guess_counter += guess_counter
#	if player_input == number_to_guess
#		puts "you win bravo"
#	else
#		puts "try again"
#	end

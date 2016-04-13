#number guessing try X
guess_count = 0
puts "Welconme to the number guessing game"
puts "First I want you to tell me the biggest number I can guess"
biggest_number = gets.chomp.to_i
puts "alright, you need to guess a number between 1 and #{biggest_number}"
puts "now how many guesses do you think you deserve to guess the number"
guess_limit = gets.chomp.to_i
puts "ok you have #{guess_limit} tries to guess a number between 1 and #{biggest_number}"
number_to_guess = rand(1..biggest_number)
#this section is for debugging
#puts "you are trying to guess #{number_to_guess}"

while guess_count < guess_limit do
	puts "what is your guess?"
	player_guess = gets.chomp.to_i
	guess_count += 1
	if player_guess == number_to_guess
		puts "Congratulations you guessed #{number_to_guess} in #{guess_count} tries"
		break
	elsif player_guess > number_to_guess
		puts "Too High, try again"
	else 
		puts "Too low, try again"
	end
end

	

#	unless player_guess == number_guess
#			message_to_player = player_guess > number_guess
#				"A bit high, try again"
#			else
#				"A tad low, try again"
#			end
#	else 
#		puts "Congratulations, this took #{guess_count} guesses"
#		exit
#	end
#end

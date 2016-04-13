#thrutwen.rb
def multcheck
	puts "please type the largest number you want your number to be divided by"
	target_num = gets.chomp.to_i
	number = target_num
	div_check = 1
	while div_check <= target_num do
		if (number % div_check == 0) && (div_check == target_num)
			puts number	
			exit
		elsif number % div_check == 0
			div_check += 1
		else
			multcheck(number+target_num)
		end
	end
end

multcheck
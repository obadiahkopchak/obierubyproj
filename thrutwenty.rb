#thrutwen.rb
def multcheck(a, b)
	number = a
	div_check = 1
	while div_check <= b do
		if (number % div_check == 0) && (div_check == b)
			puts number	
			exit
		elsif number % div_check == 0
			div_check += 1
		else
			multcheck((number+b), b)
		end
	end
end
puts "please type the largest number you want your number to be divided by"
	target_num = gets.chomp.to_i
	phil = target_num

multcheck(phil, target_num)
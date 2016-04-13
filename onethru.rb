#onethru
def multcheck(number)
	div_check = 20
	while div_check >= 1 do
		if div_check == 1
			puts number
		elsif number % div_check !=0
			multcheck((number+2000))	
		elsif number % div_check == 0
			div_check -= 1
		else
			puts "sanity check #{number}"
		end
	end
end

multcheck(20)
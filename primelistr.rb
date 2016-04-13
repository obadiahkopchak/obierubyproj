def prime_list(n)
	check_val = 2
	arr_o_primes = [2]
	if n <= 1
		puts "you put in a weird or special case, try again"
	else
		while check_val <= n
			if check_val % arr_o_primes(0) == 0	
end
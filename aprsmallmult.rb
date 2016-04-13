#SmallestMultipleProjEul
#find the smallest value divisible by 20, 19, ... 3,2,1
inc_num = 20
first_num = 20
test_num = 20
def num_check(given_num, test_val)
	if test_val == 1
		puts "#{given_num} is divisible by all the values between 1 and 20 "
	elsif given_num % test_val  == 0
		num_check(given_num, (test_val-1))
	else 
		given_num += 20
	end			
end


num_check(first_num, test_num)
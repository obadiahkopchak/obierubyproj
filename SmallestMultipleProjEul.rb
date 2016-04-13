#SmallestMultipleProjEul
test_num = 1
inc_num = 20
def num_check(given_num)
	until given_num%20 = 0 do
		given_num += 1
	end
	puts given_num
end

num_check(test_num)
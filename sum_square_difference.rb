#sum_square_difference
first_num = 1
final_num = 100

def sum_of_squares(first_num, final_num)
	count = first_num
	tally = 0
	until count > final_num do
		tally += count**2
		count += 1
	end
	
	@square = tally
	#puts "sum of squares #{tally}"
end
def sum_of_naturals(first_num, final_num)
	count = first_num
	tally_base = 0
	until count > final_num do
		tally_base += count
		count += 1
	end
	@natu = tally_base**2

	#puts "sum of naturals (squared) #{tally_base**2}"
end

sum_of_squares(first_num, final_num)
sum_of_naturals(first_num, final_num)
ans = (@natu-@square)
puts ans
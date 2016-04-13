#battleshiphashtest.rb
#battleshiphashtest
	puts "Please select one rows to target, type a" #think about moves
	move_choice_sym = gets.chomp.to_s
	puts "Please select a column to bombard, type 1"
	move_choice_num = gets.chomp.to_i
	move_choice_num_string = move_choice_num.to_s

	made_hash = move_choice_sym+move_choice_num_string

	@h1 = {"a1" => "a1", "b2" => "b2", "c3" => "c3"}
def calc_mov_pos(yval,xval)
	if yval == "a"
		selection = 0 + xval 
	elsif yval == "b"
		selection = 1 + xval
	elsif yval == "c"
		selection = 2 + xval
	elsif yval == "d"
		selection = 3 + xval
	else
		puts "how did that happen?"
	end
	print selection
end
def check_choice(num)
	if @h1[num] != num
		@h1[num] = num
		puts "testing"
	elsif @h1[num] == num 
		puts "win"
	else
		puts "try again Kopchak"
	end
end
check_choice(made_hash)
calc_mov_pos(move_choice_sym, move_choice_num)
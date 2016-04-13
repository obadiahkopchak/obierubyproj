#hash check
@h1 = {"1" => "1", "2" => "2"}
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
check_choice("2")
check_choice("3")
check_choice("3")
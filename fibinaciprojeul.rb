#fibinaciprojeul.rb
current_num = 1
prev_num = 0
nex_num = 0
while current_num < 10000000 do 
	puts current_num
	prev_num += current_num
	puts prev_num
	current_num += prev_num
end
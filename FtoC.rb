puts "What temperature would you like to convert to Celsius?"
temp_input = gets.chomp.to_i
	c_ratio = 5.0/9
	calc_temp = (temp_input-32)*c_ratio
	puts "it is #{calc_temp} degrees C"


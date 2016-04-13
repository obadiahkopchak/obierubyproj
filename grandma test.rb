#grandma test
goodbye_count = 0
puts "Hello deary, I have forgotten your name"
player_name = gets.chomp.to_s
puts "Oh that's right, your name is #{player_name}"
puts "this may be strange, but I cannot remember if you are a boy or a girl"
puts "(please type boy or girl)"
gender_select = gets.chomp.to_s.downcase

puts "A #{gender_select}?!? Reall?, the way you kids dress these days I really can't tell you apart"
puts "Anyways, what were we talking about again?"
while goodbye_count <3 do
	
	user_input = gets.chomp.to_s
	if user_input == "BYE"
		goodbye_count += 1
		if goodbye_count <3
		puts "that's sweet dear, but you can't leave yet (you need to say 'BYE' #{3-goodbye_count} more times)"
		else puts " "
		end
	elsif user_input != user_input.upcase
		puts "huh, speak up little one (try typing in caps)"
		goodbye_count = 0
	elsif user_input == user_input.upcase
		puts "NO, not since #{rand(1930..1975)}"
		goodbye_count = 0
	else
		puts "hopefully you don't see this"
		goodbye_count = 0
	end

end
puts "Well goodbye deary, I hope you found what you were looking for"




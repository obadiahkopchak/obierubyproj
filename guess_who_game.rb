guess_who_game
name gender skin hair eye


class People
	def dat_person = {"name" => "kirk", "gender" => "male/female",  "skin color" => "black/white", "hair color" => "auburn/black/blond/brown", "eye color" => "brown/blue/green"} 
	end
	

rachel      girl       black   auburn     brown
mac         boy      white    black       brown
nick          boy     white    brown       blue
angie        girl      white    auburn    green
theo         boy       white    blonde    brown
joshua     boy      white     black      brown
emily        girl      white     blonde     blue
jason      boy       white     blonde    green
john        boy        white    brown      blue
grace      girl         black     black      brown
jake        boy        white     brown     brown
megan    girl         white     blonde     green
ryan        boy      white    auburn   brown
brandon  boy      white     blonde  brown
beth         girl      white     blonde   brown
diane       girl       black     brown   brown
chris        boy      white     black     green
david       boy      black     black    brown
michelle   girl       black     brown    brown
tyson        boy      black     black    brown
ursula       girl       white     auburn  green


class GuessWho
	puts "Welcome to Guess Who, you are going to try to find who our special person is"
	puts "To help you find the special person you can ask about their gender, skin color,
	hair color, or eye color, you can ask about three details before you have to guess 
	the person"
	while guess_counter < 4 do 
	puts "Question #{guess_counter}"
	puts "Would you like to know about the person's #{feature_lister}?"
	player_question = gets.chomp.to_s
	if player_question = "male" || "female"
		#have an action that updates the list eliminating the gender that doesn't match the special person
		#update guess _counter
		guess_counter += guess_counter
	elsif player_question = "black" || "white"  # ok this probably won't work as a standalone, players
		#will need to note skin color 
		#have an action that updates the list eliminating the skin color that doesn't match the special person
		#update guess _counter	
		guess_counter += guess_counter
	elsif player_question
		

	puts ""
puts "there are girls and boys in this list, they have either black or white skin,
there eye colors are brown, blue, or green, and they're hair is black, brown, auburn, 
or blonde"
class = DeckOfCards
	attr_accessor :cards
	def initialize 
		@cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
	end
end


def begin_game
	puts "Welcome to your BlackJack Table, please be ready to play"
	#first the deck is shuffled
	game_deck = @cards.shuffle
	#2nd action the player is given two cards, they are put into the player's hand array
	player_hand = game_deck.shift(2)
	#3rd action the dealer is given their cards one card in the hidden hand the other in the visible hand
	dealer_hidden_hand = game_deck.shift
	dealer_hand = game_deck.shift
	#4th action the game now tells the player how many points they have and how many points the dealer is showing
	puts "Player shows #{this will be a method on player_hand}, and the house shows #{the value of the dealer_hand}"
	puts "Would you like to hit or stay? (H or S)"
	#5 we now enter into a period of methods, where if they hit a card is added to the player hand array
	# and a new total is displayed, as soon as they player chooses stay, it exits manipulating the player hand array 
	#and continues to updating the dealer's set up
	def hit_me
	end
	def stay_for_now
	end
	#6 it is now time for the dealer to take their cards, this will require adding the values from the 
	#dealer_hidden_hand array and the #this




#dealer_hand is to make sure there are cards in the deck

puts "this confirms I have a deck"
deck_of_cards.each do |num|
	puts num
end
puts "this is the shuffled deck"
mixed_deck = deck_of_cards.shuffle
mixed_deck.each do |num|
		puts num
end
puts "this is the player's current hand"
players_hand = mixed_deck.shift(2)
players_hand.each do |num|
	puts num
end
puts "updated deck"
mixed_deck.each do |num|
		puts num
puts mixed_deck.count
end
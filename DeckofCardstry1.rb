class = DeckOfCards
	attr_accessor :cards
	def initialize
		@cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
 		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
 		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10
		]
	end
end





#the section below is my attempt to pre-shuffle the deck


# deck_of_cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
# 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]


#this is to make sure there are cards in the deck
## deck_of_cards.each do |num|
##	  puts num
## end

##   mixed_deck = deck_of_cards.shuffle
##   mixed_deck.each do |num|
##	    puts num
##   end

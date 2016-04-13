class DeckOfCards
	attr_accessor :cards
	def initialize
		@cards = [1, 1, 1, 1, 2, 2, 2, 2, 3 , 3 ,3, 3, 4, 4, 4, 4,
5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 
10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
	end
end


def card_mixer (deck_of_cards)
	mixed_deck == deck_of_cards.shuffle

	#sourced from URL below
	#http://stackoverflow.com/questions/1816378/how-to-randomly-sort-scramble-an-array-in-ruby
end


class Player
	attr_accessor :dealt_cards, :totalscore
	def hit_me (dealer_of_cards)

	@dealt_cards << card
	dealer_of_cards.deck_of_cards.cards.delete(card)

	puts "Player has #{calculate_score} showing"
	end

	def calculate_score
		@score = 0
		@dealt_cards.each do |card|
			@score += card.values[0]
		end
		@score
	end
end






class Dealer
	attr_accessor :deck_of_cards, :dealt_cards, :score, :hidden_score
	def deal (person=nil, number)
		if person == nil
			cards = @deck.cards.sample(number)
			cards.each do |card|
			@dealt_cards << card
			@dealt_cards.first.taint
			@deck.cards.delete(card)
		end
		puts "Dealer has #{calculate_score} showing"
	end
end
def calculate_score
	@score = 0
	@hidden_score = 0

	''

class Blackjack_Game
	end

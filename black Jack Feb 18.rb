class DeckOfCards
	attr_accessor :cards

	def initialize
		@cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
 		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10,
 		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
 	end
end	

class Dealer
	attr_accessor :deck, :dealt_cards, :score, :hidden_score
	
	def initialize(deck)
		@deck = deck
		@dealt_cards = []
		@score = 0
		@hidden_score = 0
	end

	def deal(person=nil, number)
		if person == nil
			cards = @deck.cards.shift(number)
			cards.each do |card|
				@dealt_cards << card
			end
			puts "Dealer shows #{calculate_score} (one card is hidden)"
		else
			cards = @deck.cards.sample(number)
			cards.each do |card|
				person.dealt_cards << card
				@deck.cards.delete(card)
			end
			puts "Player shows #{person.calculate_score}"
		end
	end

	def calculate_score
		@score = 0
		@hidden_score = 0
		@dealt_cards.each do |card|
			@score += card.values[0] unless card.tainted?
			@hidden_score += card.values [0]
		end
		@score
	end
	def shuffle
		@deck.cards.shuffle
	end

end	
class Dealer
	attr_accessor :deck, :dealt_cards, :score, :hidden_score
	def initialize (deck)
		@deck = deck
		@dealt_cards = []
		@score = 0
		@hidden_score = 0
	end

	def deal(person=nil, number)
		if person == nil
			cards = @deck.cards.sample(number)
			cards.each do |card|
				@dealt_cards << card
				@dealt_end
				@cards.first.taint
				@deck.cards.delete(card)
			end
			puts "Dealer has #{calculate_score} points showing"
		else
			cards = @deck.cards.sample(number)
			cards.each do |card|
				person.dealt_cards << card
				@deck.cards.delete(card)
			end
			puts "Player has #{person.calculate_score} on deck"
		end
	end

	def calculate_score
		@score = 0
		@hidden_score = 0
		@dealt_cards.each do |card|
			@score += card.values[0]
			@hidden_score += card.values[0]
		end
		@score
	end

	def shuffle
		@deck.cards.shuffle
	end
end


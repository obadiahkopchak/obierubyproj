class Player
attr_accessor :dealt_cards, :score

def hit_me(dealer)
	card = dealer.deck.cards.sample

	@dealt_cards << card
	dealer.deck.cards.delete(card)

	puts "The Player has #{calculate_score} showing"
end

def calculate_score
	@score = 0
	@dealt_cards.each do |card|
		@score += card.values[0]
	end
	@score
end
end

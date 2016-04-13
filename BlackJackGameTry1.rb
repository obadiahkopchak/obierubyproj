require 'DeckofCardstry1.rb'
require 'DealerTry1.rb'
require 'PlayerTry1.rb'


class Blackjack_Game
	attr_accessor :player, :dealer
	def initialize (dealer, player)
		@player = player
		@dealer = dealer
		@stater = ""
	end

	def start
		puts "Let's start with a quick shuffle"
		@dealer.shuffle

		@dealer.deal (2)
		@dealer.deal (@player, 2)

		#this is the first score check
		if @player.score == 21 && @dealer.hidden_score != 21
			player_wins  #as this first trial doesn't have a betting pool, they just win
			busts
		end

		if @dealer.hidden_score == 21 && @player.score != 21
			dealer_wins #basically it will just show a "house wins for the dealer"
			busts
		end

		puts " Would you like to hit or stay"
		choice = gets.chomp.downcase
		

		until choice == "stay"
			@player.hit_me(@dealer)
			if @player.score <= 21
				choice = gets.chomp.downcase
			else
				dealer_wins
				busts
			end
		end

		if @player.score == 21
			player_wins
			busts
		end

		puts "dealer stays" if @dealer.hidden_score >= 17

		if @dealer.hidden_score < 17
			puts "dealer takes another card"
			@dealer.deal(1)
			if @dealer.hidden_score > 21
				player_wins
				busts
			end
		end
	end

	puts "How we doin' folks?"
	puts "Dealer has #{@dealer.hidden_score}"
	winning_determinant

	busts

	end
end

def winning_determinant
	if @dealer.hidden_score > @player.score
		dealer_wins
	elsif @dealer.hidden_score < @player.score
		player_wins
	elsif @dealer.hidden_score == @player.score
		puts "You guys tie (which means the house wins)"
	else puts "something broke, seriously how did no one win or lose?"
	end
end

def dealer_wins
	player_final_hand
	dealer_final_hand
	puts "the house wins, better luck next time"
end

def player_wins
	dealer_final_hand
	player_final_hand
	puts "You Win, now you gonna buy me that drink?"
end

def player_final_hand
	a = "You're score is "
	@player.dealt_cards.each do |card|
		card.each_key do |key|  #I think I need to change this, I am betting this is hash based
			a << "{key};"
		end
	end
	puts a + "#{@player.score}"
end

def dealer_final_hand
	a = "Dealer's score is "
@dealer.dealt_cards.each do |card|
	card.each_key do |key|  #I think I need to change this, I am betting this is hash based
		a << "#{key};"
	end
end
puts a + "#{@dealer.hidden_score}"
end

def reset_game
	@dealer.score = 0 
	@dealer.hidden_score = 0
	@dealer.dealt_cards = []

	@player.score = 0
	@player.dealt_cards =[]

	@dealer.deck = DeckOfCards.new
end

def busts
	reset_game

	puts "Would you like to play again (Yes or No"
		@starter = gets.chomp.downcase
		if @starter != "no"
			start
		else 
			return "Have a Nice Day"
		end
	end
	
end










	end


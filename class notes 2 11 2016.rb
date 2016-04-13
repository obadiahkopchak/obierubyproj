#class notes 2 11 2016
#The Hangover 4 # The Regret
class Player
#attributes
#+health
#+attack value
#+defense value
#methods
#use Item
#move
#	
end

class Game

end

class Boss

end

class Item
	#useable
	#takeable
	#consumable

end

class Room
	#exits 
		# open or closed
	#holds objects
	#location

end


#Guess Who notes
require 'csv'
class Player

	@@suspect_pool = list_of_suspects

	attr_accessor :guilty, :list_of_suspects

end

class Suspect
	attr_accessor :name, :gender, :skin, :hair, :eye, :facedown

	@face_down = false

end

class Game
	attr_accessor :turn_count
	attr_reader :list_of_suspects 
	def initialize 
		turn_count = 0
		load_suspects
		add_player

	end	
	private
	def load_suspects #this loads the CSV file that has the list of suspects
		f = File.read('#file name to be added#')
		parsed = CSV.parse(f)
		@list_of_suspects = []
		parsed.each { |name, gender, skin, hair, eye| @list_of_suspects.push Suspect.new(name,gender,skin,hair,eye)}
	end

	def add_player
		2.times do 
			Player.new
			Player.list_of_suspects = @@list_of_suspects
		end
	end

	def pick_guilty_suspect #provides guilty suspect for players
				
	end
end

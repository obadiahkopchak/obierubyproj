#dueling room
class Creature
#attack, health, and speed, should all be whole integers
attr_accessor :name, :attack, :health, :speed
	def initialize (name, attack, health, speed)
		@name = name
		@attack = attack
		@health = health
		@speed = speed
	end
	#this is a debug stats check
	def debug_stats_check
	puts "#{@name}has #{@attack} attack points, #{@health} hit points, and has an attack speed of #{@speed}"
	end
end	

class Room
	attr_accessor :position, :doors, :creature_list
	def initialize
		creature_1 = Creature.new("steve", 2,2,2)
		creature_2 = Creature.new("bill", 1,1,1)
		
	end
	def combat
		if creature_1.speed >= 

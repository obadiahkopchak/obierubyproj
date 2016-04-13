#these beings can inhabit a room, do damage, be alive or dead
class Creature
attr_accessor :health, :damage, :speed
	def initialize(health, damage, speed)
	@health = health
	@damage = damage
	@speed = speed
	end
end
#Boss is a sub class of Creature
class Boss < Creature
	attr_accessor :special
	def initialize ()
	@special = special
end
#player is a sub class of creature, 
#they have the ability to move between rooms,
#add items to their inventory
class Player < Creature
	attr_accessor :passive_item, :active_item
end
#Items help to modify characteristics of the player
#either positively or negatively
#they might also have the feature of needing to be activated
class Item
	attr_accessor :is_active, :feature
	def initialize ()
end
# rooms can hold creatures and items.  Rooms can have doors on the North, East, West, or South walls
# doors can either exist or not exist
class Room
	attr_accessor :north_door, :east_door, :west_door, :south_door, :has_creatures, :has_items
	def initialize ()
end

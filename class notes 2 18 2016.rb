#class notes
 something = Thing.new
  class Thing
  	def act
  	end
  	def other_act
  		self.act #--> something.act  this would be bad
  	end
  end

class Person
	def initialize (name, gender)
	@name = name
	@gender = gender
	end
	def introduce_self
		puts "hi, my name is #{@name}"
	end
	def explain_gender
		puts "I currently identify as #{@gender}"
	end
	def do_both
		introduce_self
		explain_gender
	end
end

nancy=Person.new("Nancy", "female")
nancy.introduce_self
phil=Person.new("Phil", "male")
phil.introduce_self
corban=Person.new("Corban", "Meat Popsicle")
corban.introduce_self
corban.explain_gender
nancy.do_both
class TargBoard
	attr_accessor :board_owner, :board_number

	def initialize (board_owner, x_size, y_size)
		@board_display = []
		@x_axis = ["01","02","03","04","05","06","07","08","09","10","11","12","13",
		     	   "14","15","16","17","18","19","20","21","22","23","24","25","26"]
		@y_axis = "abcdefghijklmnopqrstuvwxyz"
		@a = x_size
		@b = y_size
		get_dimensions
		display_board
	end

	#calc_griz, gen array and get_dimensions
	#are elements designed to generate the board that you display the game on 

	def gen_array(grid_size)
		i = 0
		while i < grid_size do
			@board_display.push(0)
			i += 1
		end
	end

	def get_dimensions
		grid_size = @a * @b
		gen_array(grid_size)
	end

	def gen_x_axis(a)
		i = 0
		print "0 "
		while i < a do
			print "#{@x_axis[i]} "
			i += 1
		end
		print "\n"	 
	end

	def gen_given_row(a,b,current_row)
		print "#{@y_axis[current_row]} "
		j = 0
		k = a * current_row
		while j < a do
			t = j + k
			print  "#{@board_display[t]}  "
			j += 1
		end 
		print "\n"
	end

	def all_rows(a,b)
		l = 0
		while l < @b do
			gen_given_row(@a,@b,l)
			l += 1
		end
	end

	def display_board
		gen_x_axis(@a)
		all_rows(@a,@b)
	end

	def update_display(shot_pos, symb)
		@board_display.insert((shot_pos-1), symb)
		@board_display.delete_at(shot_pos)
	end
end
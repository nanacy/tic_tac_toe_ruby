class BoardCase
	attr_accessor :value

	def initialise
		@value = nil
	end

	def set_case(new_value)
		@value = new_value
	end
end
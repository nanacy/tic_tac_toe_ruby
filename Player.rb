class Player
	attr_accessor :pseudo ,:forme

	def initialize(pseudo, forme)
		@pseudo = pseudo
		@forme = forme
	end

	def info
		puts "Joueur : #{@pseudo}"
		puts "Joue avec : #{@forme}"
	end

	def get_forme
		return @forme
	end

	def get_pseudo
		return @pseudo.capitalize
	end

end
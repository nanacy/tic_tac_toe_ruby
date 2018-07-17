load 'Board.rb'
load 'Player.rb'
load 'BordCase.rb'

class Game
	attr_accessor :joueur1, :joueur2, :plateau

	def initialize
		#Crée les joueurs
		print "Entrez le pseudo du joueur 1 -> "
		@joueur1 = Player.new(gets.chomp, "X")
		@joueur1.info
		puts
		print "Entrez le pseudo du joueur 2 -> "
		@joueur2 = Player.new(gets.chomp, "O")
		@joueur2.info

		#Crée le plateau
		@plateau = Board.new()
	end

	def choix_position
		ligne = 0
		colonne = 0
		
		# tant que le user ne rentre pas une position possible
		loop do 
			# tant que le user ne rentre pas une position existante
			while ligne > 3 || ligne < 1
				ligne = 0
				colonne = 0		
				print "Choisir ligne entre 1 et 3 -> "
				ligne = gets.chomp.to_i
			end 
			while colonne > 3 || colonne < 1
				print "Choisir colonne entre 1 et 3 -> "
				colonne = gets.chomp.to_i
			end
			ligne -= 1
			colonne -= 1

			break if @plateau.get_tab[ligne][colonne].value==nil
		end

		return @plateau.get_tab[ligne][colonne]
	end


	def end_game
		fin = false
		3.times do |ligne|
			3.times do |colonne|
				if @plateau.get_tab[ligne][colonne].value == nil
					return fin = false
				end
			end
		end
		return true				
	end

	def main
		5.times do |tour|
			# TOUR JOUEUR 1
			puts
			@plateau.affichage
			puts
			puts
			print "\t" , "-"*12, "\n"
			puts "\t|  JOUEUR 1 : #{@joueur1.get_pseudo}"
			print "\t" , "-"*12, "\n"
			a = nil
			loop do
				a = choix_position
				break unless a==nil
			end
			a.set_case(@joueur1.get_forme)

			# AFFICHAGE MORPION
			@plateau.affichage
			# VERIFIE VICTOIRE
			if @plateau.verif == true
				puts "-"*23
				puts "| VICTOIRE du joueur1 |"
				puts "|\tCONGRATZ      |"
				puts "-"*23
				return true
			end
			puts

			# FIN DE JEU(?) = égalité
			if end_game == true
				puts "-"*19
				puts "| END OF THE GAME |"
				puts "|-- It's a draw --|"
				puts "-"*19
				return false
			end

			# TOUR JOUEUR 2
			print "\t" , "-"*12, "\n"
			puts "\t|  JOUEUR 2 : #{@joueur2.get_pseudo}"
			print "\t" , "-"*12, "\n"
			a=choix_position
			a.set_case(@joueur2.get_forme)

			# AFFICHAGE MORPION
			@plateau.affichage
			# VERIFIE VICTOIRE	
			if @plateau.verif == true
				puts "-"*23
				puts "| VICTOIRE du joueur2 |"
				puts "|\tCONGRATZ      |"
				puts "-"*23
				return true
			end

		end
	end
end

#return TRUE = VICTOIRE
#return FALSE = EGALITE

#####################################################


loop do
	jeu = Game.new()
	jeu.main

	puts "Voulez vous refaire une partie ?(o/n)"
	break if gets.chomp == "n"
end
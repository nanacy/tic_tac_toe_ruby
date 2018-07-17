class Board
	attr_accessor :tab_case

	def initialize
		@tab_case = [
			[ BoardCase.new, BoardCase.new, BoardCase.new ], #ligne1 
			[ BoardCase.new, BoardCase.new, BoardCase.new ], #ligne2
			[ BoardCase.new, BoardCase.new, BoardCase.new ]  #ligne3
		]
	end

	def affichage
		print "\t",  "-"*13, "\n"
		3.times do |x|
			print "\t| "
			3.times do |y|
				if @tab_case[x][y].value==nil
					print ". | "
				else
					print "#{@tab_case[x][y].value} | "
				end
			end
			puts
			print "\t",  "-"*13, "\n"
		end
	end

	def verif
		# VERIF LIGNE
		3.times do |ligne|
	        var_verif = 0
	        2.times do |col|
	            if @tab_case[ligne][col].value == nil
	            elsif !(@tab_case[ligne][col].value == @tab_case[ligne][col+1].value)
	            else
	                var_verif += 1
	            end
	            if var_verif == 2
	                return true 
	            end
	        end
	    end

		# VERIF COLONNE
		puts
		3.times do |col|
	        var_verif = 0
	        2.times do |ligne|
	            if @tab_case[ligne][col].value == nil
	            elsif !(@tab_case[ligne][col].value == @tab_case[ligne+1][col].value)
	            else
	                var_verif += 1
	            end
	            if var_verif == 2
	                # "SUCCES DE LA COLONNE"
	                return true
	            end
	        end
	    end

	    #VERIF DIAGONALE

		# pas une diagonale de nil
		if @tab_case[1][1].value !=nil
			#diago1
			if @tab_case[0][0].value == @tab_case[1][1].value && @tab_case[1][1].value == @tab_case[2][2].value
				return true
			#diago2
			elsif @tab_case[0][2].value == @tab_case[1][1].value && @tab_case[1][1].value == @tab_case[2][0].value
				return true
			end
		end
	    
	    return false
	end

	def get_tab
		return @tab_case
	end

end
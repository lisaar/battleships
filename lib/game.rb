class Game

	def initialize(player1, player2)
		@players = [player1, player2]
		@name = []
		@fleet = []
	end

	def has_two_players?
		@players
	end

	def print_header
		puts "Welcome to Battleships\n You have 5 ships in your naval fleet\n Your mission is to destroy the enemy!"
	end

	def player1_name_prompt
		puts "What is your name pirate?"
		player = get_player_input
		@name << player
	end

	def player1_mission_statement
		puts "Ahoy there, #{@name[0]}.\n Set those ships sailing. Our enemies ships aren't gonna raid themselves"
	end

	def player2_name_prompt
		puts "What is your name captain?"
		player = get_player_input
		@name << player
	end

	def player2_mission_statement
		puts "Quick, Captain #{@name[1]}.\n Start your fleet sailing, those pesky pirates are already one step ahead of the game"
	end

	def get_player_input
		gets.chomp
	end

	def initial_ship_placement_statement
		puts "Time to command your fleet to sail around the world, to attack the enemy!"
	end

	def ask_for_coordinates
		puts "Please enter the coordinates of your ship and press enter after each coordinate"
		coordinate = get_player_input.to_sym
		@fleet << coordinate
		coordinate = get_player_input.to_sym
		@fleet << coordinate
	end

end
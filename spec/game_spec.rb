require 'game'

describe Game do
	let(:player1) {Player.new(Board.new)}
	let(:player2) {Player.new(Board.new)}
	let(:game) {Game.new(player1, player2)}

	context 'starting the game' do
		
		it 'can intialize a game with two players' do
			expect(game).to have_two_players
		end

		it 'prints header statement' do
			expect(game).to receive(:puts).and_return("Welcome to Battleships\n You have 5 ships in your naval fleet\n Your mission is to destroy the enemy!")
			game.print_header

		end

		it 'prompts player 1 to input their name' do
			expect(game).to receive(:puts).and_return("What is your name pirate?")
			allow(game).to receive(:gets).and_return("Francis Drake")	
			game.player1_name_prompt
		end

		it 'prints player 1 name and mission' do
			expect(game).to receive(:gets).and_return("Francis Drake")
			expect(game.get_player_input).to eq ("Francis Drake")
			expect(game).to receive(:puts).and_return("Ahoy there, Francis Drake.\n Set those ships sailing. Our enemies ships aren't gonna raid themselves")
			game.player1_mission_statement
		end

		it 'prompts player 2 to input their name' do
			expect(game).to receive(:puts).and_return("What is your name captain?")
			allow(game).to receive(:gets).and_return("Medina Sidonia")
			game.player2_name_prompt
		end

		it 'prints player 2 name and mission' do
			expect(game).to receive(:gets).and_return("Medina Sidonia")
			expect(game.get_player_input).to eq ("Medina Sidonia")
			expect(game).to receive(:puts).and_return("Quick, Captain Medina Sidona.\n Start your fleet sailing, those pesky pirates are already one step ahead of the game")
			game.player2_mission_statement
		end
		

	end

	context 'placing ships' do
		it 'prints a statement to tell player to place their ships' do
			expect(game).to receive(:puts).and_return("Time to command your fleet to sail around the world, to attack the enemy!")
			game.initial_ship_placement_statement
		end

		it 'aks for coordinates for the ship' do
			expect(game).to receive(:puts).and_return("Please enter the coordinates of your ship and press enter after each coordinate")
			allow(game).to receive(:gets).and_return("A1")
			allow(game).to receive(:gets).and_return("A2")
			game.ask_for_coordinates
		end
	end
	
end
require 'board'

describe Board do
	let(:player_board) {Board.new}
	let(:ship) {double :ship, coordinates: [:A1, :B1, :C1]}
	let(:shot_ship) {double :ship, coordinates: [:A1, :B1, :C1], shoot_at: :true}


	context 'creates the board' do

		it 'as a 10 x 10 hash of coordiantes' do
			expect(player_board.grid.count).to eq 100
		end

		it 'initialized with no ships' do
			expect(player_board).not_to have_ships
		end
	end

	context 'placing ships' do

		it 'marks S where ship is placed' do
			player_board.place(ship)
			expect(player_board.grid[:A1]).to eq 'S'
		end


		it 'should have ships when ships have been placed on the board' do
			player_board.place(ship)
			expect(player_board).to have_ships
		end

		it 'pulls out the correct ship from ships array when shot is fired' do |variable|
			another_ship = double :ship, coordinates: [:F1]
			player_board.place(ship)
			player_board.place(another_ship)
			expect(player_board.get_ship_at(:A1)).to eq ship
		end
	end

	context 'shooting ships' do

		it 'marks an x where a ship is hit' do
			player_board.place(shot_ship)
			player_board.shoot_at(:A1)
			expect(player_board.grid[:A1]).to eq 'x'
		end


		it 'marks a missed shot as o on the board' do
			player_board.mark_missed_shot_at :A8 
			expect(player_board.grid[:A8]).to eq 'o'	
		end
		

		it 'tells ship to register a shot' do
			player_board.place(ship)
			expect(ship).to receive(:shoot_at).with(:A1)
			player_board.mark_hit_shot_at(ship, :A1)	
		end

	end

	context 'raising errors if already shot at that coordinate' do |variable|
			
		it 'raises an error if shot off the board is invalid' do
			expect{ player_board.shoot_at(:C11)}.to raise_error(RuntimeError)
		end

		it 'raises an error if it shoots at an already shot ship square' do
			player_board.place(shot_ship)
			player_board.shoot_at(:A1)
			expect{ player_board.shoot_at(:A1)}.to raise_error(RuntimeError)
		end

		it 'raises an error if it shoots at an already shot ship square' do
			player_board.shoot_at (:B1)
			expect{ player_board.shoot_at(:B1)}.to raise_error(RuntimeError)
		end
	end

	

end
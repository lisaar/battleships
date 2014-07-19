require 'ship'

describe Ship do

	let(:ship) {Ship.new([:A1, :A2])}

	it 'intializes ships with coordinates' do
		expect(ship).to have_coordinates
	end

	it 'has a length' do
		expect(ship.length).to eq 2
		ship = Ship.new([:A1, :A2, :A3])
		expect(ship.length).to eq 3
	end

	it 'has hits when ship is shot at a certain coordinate' do
		expect(ship.shot_at(:A1)).to have_hits
	end

	it 'cannot be sunk first initalized' do
		expect(ship).not_to be_sunk
	end

	it 'can be sunk when all ships coordinates have been hit' do
		ship.shot_at(:A1)
		ship.shot_at(:A2)
		expect(ship).to be_sunk
	end
	
end
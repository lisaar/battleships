require 'coordinates'

describe Coordinates do
	it 'can be initialized with coordinates' do
		init_coordinate = Coordinates.new(:A1)
		expect(init_coordinate.coordinate).to eq :A1
	end
end
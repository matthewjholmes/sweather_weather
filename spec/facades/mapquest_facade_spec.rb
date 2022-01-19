require 'rails_helper'

describe MapquestFacade, type: :facade do
  describe 'class methods' do

    describe '.get_coords' do
      it 'returns a weather object' do
        location = MapquestFacade.get_coords('denver,co')
        expect(location).to be_a(Location)
      end
    end

    describe '.get_directions' do
      it 'returns a directions object' do
        directions = MapquestFacade.get_directions(params: {origin: 'denver,co', destination: 'lakewood,co'})
        expect(directions).to be_a(Direction)
      end
    end
  end
end

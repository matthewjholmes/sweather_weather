require 'rails_helper'

describe RoadTripFacade, type: :facade do
  describe 'class methods' do

    describe '.generate_road_trip' do
      it 'returns a road trip object' do
        trip = RoadTripFacade.generate_road_trip(params: {origin: 'denver,co', destination: 'lakewood,co')
        expect(trip).to be_a(RoadTrip)
      end
    end

  end
end

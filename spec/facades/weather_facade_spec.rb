require 'rails_helper'

describe WeatherFacade, type: :facade do
  describe 'class methods' do
    describe '.get_forecast', :vcr do
      it 'returns a weather object' do
        weather = WeatherFacade.get_weather('denver,co')
        expect(weather).to be_an_instance_of(Weather)
      end
    end
  end
end

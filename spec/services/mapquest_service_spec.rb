# require 'rails_helper'
#
# describe MapService, type: :service do
#   describe 'class methods' do
#
#     describe '.get_coords' do
#       it 'returns the location details as a hash' do
#         coords = MapquestService.get_coords('denver,co')
#         expect(coords).to be_a(Hash)
#         expect(coords[:results].first[:providedLocation][:location]).to eq(location)
#         expect(coords[:results].first[:locations].first[:displayLatLng][:lat]).to be_a(Float)
#         expect(coords[:results].first[:locations].first[:displayLatLng][:lng]).to be_a(Float)
#       end
#     end
#
#     describe '.get_directions' do
#       it 'returns the location details as a hash' do
#         directions = MapquestService.get_directions({origin: 'denver,co', destination: 'pueblo,co'})
#         expect(directions).to be_a(Hash)
#
#         expect(directions).to have_key(:route)
#         expect(directions[:route]).to be_a(Hash)
#
#         expect(directions[:route]).to have_key(:locations)
#         expect(directions[:route][:locations]).to be_an(Array)
#         expect(directions[:route][:locations].size).to eq(2)
#
#         directions[:route][:locations].each do |location|
#           expect(location).to be_a(Hash)
#
#           expect(location).to have_key(:adminArea5)
#           expect(location[:adminArea5]).to be_a(String)
#
#           expect(location).to have_key(:adminArea3)
#           expect(location[:adminArea3]).to be_a(String)
#         end
#
#         expect(directions[:route][:locations].first[:adminArea5]).to eq(origin_city)
#         expect(directions[:route][:locations].first[:adminArea3]).to eq(origin_state)
#         expect(directions[:route][:locations].last[:adminArea5]).to eq(destination_city)
#         expect(directions[:route][:locations].last[:adminArea3]).to eq(destination_state)
#
#         expect(directions[:route]).to have_key(:realTime)
#         expect(directions[:route][:realTime]).to be_an(Integer)
#
#         expect(directions[:route]).to have_key(:time)
#         expect(directions[:route][:time]).to be_an(Integer)
#
#         expect(directions).to have_key(:info)
#         expect(directions[:info]).to be_a(Hash)
#
#         expect(directions[:info]).to have_key(:statuscode)
#         expect(directions[:info][:statuscode]).to be_an(Integer)
#         expect(directions[:info][:statuscode]).to eq(0)
#       end
#     end
#   end
# end

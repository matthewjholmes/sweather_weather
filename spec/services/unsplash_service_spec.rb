# require 'rails_helper'
#
# describe UnsplashService, type: :service do
#   describe '.get_background_image' do
#     it 'returns the image in a hash' do
#       image = UnsplashService.get_background_image('denver, co')
#
#       expect(image).to be_a(Hash)
#
#       expect(image).to have_key(:results)
#       expect(image[:results]).to be_a(Array)
#
#       expect(image[:results].first).to have_key(:description)
#       expect(image[:results].first[:description]).to be_a(String)
#
#       expect(image[:results].first).to have_key(:urls)
#       expect(image[:results].first[:urls]).to be_a(Hash)
#
#       expect(image[:results].first[:urls]).to have_key(:full)
#       expect(image[:results].first[:urls][:full]).to be_a(String)
#
#       expect(image[:results].first).to have_key(:user)
#       expect(image[:results].first[:user]).to be_a(Hash)
#
#       expect(image[:results].first[:user]).to have_key(:username)
#       expect(image[:results].first[:user][:username]).to be_a(String)
#
#       expect(image[:results].first[:user]).to have_key(:links)
#       expect(image[:results].first[:user][:links]).to be_a(Hash)
#
#       expect(image[:results].first[:user][:links]).to have_key(:html)
#       expect(image[:results].first[:user][:links][:html]).to be_a(String)
#     end
#   end
# end

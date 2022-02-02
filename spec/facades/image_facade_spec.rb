require 'rails_helper'

describe ImageFacade, type: :facade do
  describe 'class methods' do
    describe '.get_background_image' do
      it 'returns an image object' do
        image = ImageFacade.get_background_image('denver,co')
        expect(image).to be_a(Image)
      end
    end
  end
end

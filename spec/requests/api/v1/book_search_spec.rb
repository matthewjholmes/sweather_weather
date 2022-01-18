require 'rails_helper'

RSpec.describe "book search api endpoint" do
  describe "GET /api/v1/book-search?location=[LOCATION]&quantity=[QUANTITY]"
  before do
    get "/api/v1/book-search?location=denver,co&quantity=5"
  end

  it 'returns a list of books and a forecast' do
    data = JSON.parse(response.body, symbolize_names: :true)

    expect(response).to be_successful
    expect(data).to have_key(:destination)
    expect(data[:destination]).to be_a(String)

    expect(data).to have_key(:forecast)
    expect(data[:forecast]).to be_a(Hash)
    expect(data[:forecast]).to have_key(:summary)
    expect(data[:forecast][:summary]).to be_a(String)
    expect(data[:forecast]).to have_key(:temperature)
    expect(data[:forecast][:temperature]).to be_a(String)

    expect(data).to have_key(:total_books_found)
    expect(data[:total_books_found]).to be_a(Integer)

    expect(data).to have_key(:books)
    expect(data[:books].count).to eq(5)
    expect(data[:books].first).to have_key(:isbn)
    expect(data[:books].first[:isbn]).to be_a(Array)
    expect(data[:books].first).to have_key(:title)
    expect(data[:books].first[:title]).to be_a(String)
    expect(data[:books].first).to have_key(:publisher)
    expect(data[:books].first[:publisher].first).to be_a(String)
  end

  xit 'returns error if quantity is not an integer > 0' do
    zero = BookSearchFacade.book_search_by_location('denver,co', 0)
    negative = BookSearchFacade.book_search_by_location('denver,co', -5)
    float = BookSearchFacade.book_search_by_location('denver,co', 1.5)
    missing = BookSearchFacade.book_search_by_location('denver,co')

    expect(zero).to have_key(:errors)
    expect(negative).to have_key(:errors)
    expect(float).to have_key(:errors)
    expect(missing).to have_key(:errors)
  end
end

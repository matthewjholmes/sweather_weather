require 'rails_helper'

RSpec.describe BookSearchResult do

  it 'has correct results and datatypes' do
    results = BookSearchFacade.book_search_by_location('denver,co', 5)

    expect(results).to be_a(BookSearchResult)
    expect(results.id).to eq(nil)

    expect(results.destination).to eq('denver,co')
    expect(results.destination).to be_a(String)

    expect(results.forecast).to include(:summary)
    expect(results.forecast).to include(:temperature)

    expect(results.total_books_found.to_i).to be_a(Integer)

    results.books.each do |book|
      expect(book).to include(:isbn)
      expect(book).to include(:title)
      expect(book).to include(:publisher)
      expect(book).to_not include(:author)
    end
  end
  
end

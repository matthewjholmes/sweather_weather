require 'rails_helper'

RSpec.describe BookSearchFacade do

  it '.book_search_by_location returns a BookSearchResult object' do
    search = BookSearchFacade.book_search_by_location('denver,co', 5)

    expect(search).to be_a(BookSearchResult)
  end

end

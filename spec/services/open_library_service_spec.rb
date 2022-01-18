require 'rails_helper'

RSpec.describe OpenLibraryService do
  it '.book_search_by_location returns a valid hash' do
    data = OpenLibraryService.book_search_by_location('denver,co', 5)

    expect(data).to be_a(Hash)

    expect(data).to have_key(:numFound)
    expect(data[:numFound]).to be_an(Integer)

    expect(data).to have_key(:q)
    expect(data[:q]).to be_a(String)

    expect(data).to have_key(:docs)
    expect(data[:docs]).to be_an(Array)
    expect(data[:docs].count).to eq(5)

    data[:docs].each do |book|
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_an(Array)

      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)

      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an(Array)
      expect(book[:publisher].first).to be_a(String)
    end
  end
end

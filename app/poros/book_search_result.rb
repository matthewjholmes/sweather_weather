class BookSearchResult
  attr_reader :id,
              :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(books, forecast)
    # require "pry"; binding.pry
    @id                = nil
    @destination       = books[:q]
    @forecast          = book_forecast(forecast)
    @total_books_found = books[:numFound]
    @books             = book_data(books)

  end

  def book_forecast(forecast)
    {
      summary: forecast[:current][:weather].first[:description],
      temperature: "#{forecast[:current][:temp].to_i}°F"
    }
  end

  def book_data(books)
    books[:docs].map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end
end

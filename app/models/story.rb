class Story
  attr_reader :headline,
              :url,
              :byline,
              :abstract,
              :thumbnail,
              :keywords,
              :books

  def initialize(data)
    @headline   = data[:title]
    @url        = data[:url]
    @byline     = data[:byline]
    @abstract   = data[:abstract]
    @thumbnail  = data[:multimedia][1][:url] unless data[:multimedia].empty?
    @keywords   = data[:des_facet]
    @books      = generate_books
  end

  def generate_books
    @keywords.map do |keyword|
      get_books(keyword).map do |raw_book_data|
        Book.new(raw_book_data)
      end
    end.flatten
  end

  def get_books(keyword)
    keyword = format_keyword(keyword)
    response = Faraday.get("https://www.googleapis.com/books/v1/volumes?q=#{keyword}&maxResults=5&orderBy=relevance")
    JSON.parse(response.body, symbolize_names: true)[:items]
  end

  def format_keyword(keyword)
    keyword.gsub(" ","+")
  end
end

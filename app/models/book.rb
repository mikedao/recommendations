class Book
  attr_reader :title,
              :thumbnail,
              :buy_link
  def initialize(data)
    @title      = data[:volumeInfo][:title]
    @thumbnail  = data[:volumeInfo][:imageLinks][:thumbnail] if data[:volumeInfo][:imageLinks]
    @buy_link   = data[:saleInfo][:buyLink]
  end
end

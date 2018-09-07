class Book
  attr_reader :title,
    :thumbnail,
    :buy_link
  def initialize(data)
    @thumbnail  = data[:volumeInfo][:imageLinks][:thumbnail] if data[:volumeInfo][:imageLinks]
    @buy_link   = generate_amazon_link(data[:volumeInfo][:title])
    @title      = data[:volumeInfo][:title].gsub("+", " ")
  end

  def generate_amazon_link(raw_title)
    url_title = format_title(raw_title)
    "https://www.amazon.com/s/ref=as_li_ss_tl?url=search-alias=aps&field-keywords=#{url_title}&tag=newsrecommend-20&language=en_US"
  end

  def format_title(raw_title)
    raw_title.gsub("'", "").gsub(" ", "+").gsub("’", "")
  end
end

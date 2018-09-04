class Story
  attr_reader :headline,
              :url,
              :byline,
              :abstract,
              :thumbnail,
              :keywords

  def initialize(data)
    @headline   = data[:title]
    @url        = data[:url]
    @byline     = data[:byline]
    @abstract   = data[:abstract]
    @thumbnail  = data[:multimedia][1][:url]
    @keywords   = data[:des_facet]
    generate_books
  end


  def generate_books
    @keywords.each do |keyword|
    end
  end

end

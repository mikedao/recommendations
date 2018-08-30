class Story
  attr_reader :headline
  def initialize(data)
    @headline = data[:title]
  end
end

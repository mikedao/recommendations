class DashboardController < ApplicationController
  def show
    conn = Faraday.new(url: "https://api.nytimes.com") do |faraday|
      faraday.headers["api-key"] = ENV["nyt-api-key"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/svc/topstories/v2/home.json")
    raw_stories = JSON.parse(response.body, symbolize_names: true)[:results]
    @stories = []
    raw_stories.each do |raw_story|
      @stories << Story.new(raw_story) unless raw_story[:des_facet].empty?
      return @stories if @stories.count > 4
    end
  end
end

class DashboardController < ApplicationController
  def show
    binding.pry
    conn = Faraday.new(url: "https://api.nytimes.com") do |faraday|
      faraday.headers["api-key"] = ENV["nyt-api-key"]
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/svc/topstories/v2/home.json")
    raw_stories = JSON.parse(response.body, symbolize_names: true)[:results][0..4]
    @stories = raw_stories.map do |raw_story|
      Story.new(raw_story)
    end

  end

end

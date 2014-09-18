class EventfulApi
  include HTTParty


  def self.getData(params)
    res = HTTParty.get("http://api.eventful.com/json/events/search?c=" + params[:searchTerm] + "&l=" + params[:searchLocation] + "&within=" + params[:searchRadius] + "&date=" + params[:searchDate] + "&app_key=#{ENV["eventful_api_key"]}")
    data = JSON.parse(res.body)
    events = []
    data["events"]["event"].each do |e|
      event = {}

      event["title"] = ActionView::Base.full_sanitizer.sanitize(e["title"])
      event["description"] = ActionView::Base.full_sanitizer.sanitize(e["description"])
      event["start_time"] = ActionView::Base.full_sanitizer.sanitize(e["start_time"])
      event["latitude"] = ActionView::Base.full_sanitizer.sanitize(e["latitude"])
      event["longitude"] = ActionView::Base.full_sanitizer.sanitize(e["longitude"])

      events << event
    end
    events
  end


end

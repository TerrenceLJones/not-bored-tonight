class EventfulApi
  include HTTParty


  def self.getData(params)
    res = HTTParty.get("http://api.eventful.com/json/events/search?c=" + params[:searchTerm] + "&l=" + params[:searchLocation] + "&within=" + params[:searchRadius] + "&date=" + params[:searchDate] + "&app_key=#{ENV["eventful_api_key"]}")
    data = JSON.parse(res.body)
    events = []
    data["events"]["event"].each do |e|
      event = {}

      event["name"] = e["title"]
      event["description"] = ActionView::Base.full_sanitizer.sanitize(e["description"])
      event["time"] = e["start_time"]
      event["venue_name"] = e["venue_name"]
      event["address"] = e["venue_address"]
      event["city"] = e["city"]
      event["state"] = e["region_name"]
      event["zip_code"] = e["postal_code"]
      event["country"] = e["country_name"]
      event["address_string"] = "#{event["address"]} #{event["city"]} #{event["state"]} #{event["zip_code"]} #{event["country"]}"

      events << event
    end
    events
  end


end

class EventfulApi
  include HTTParty

  # "ADD IN RESCUE WHEN THERE ARE NO EVENTS AVAILABLE"

  def self.getData(params)
    res = HTTParty.get("http://api.eventful.com/json/events/search?c=" + EventfulApi.sanitize_search_term_params(params[:searchTerm]) + "&l=" + params[:searchLocation] + "&within=" + params[:searchRadius] + "&date=" + params[:searchDate] + "&app_key=#{ENV["eventful_api_key"]}")
    data = JSON.parse(res.body)
    events = []

    begin
      data["events"]["event"].each do |e|
        event = {}
        event["category"] = params[:searchTerm]
        event["name"] = e["title"]
        event["description"] = ActionView::Base.full_sanitizer.sanitize(e["description"])
        event["date"] = DateTime.parse(e["start_time"]).strftime("%B %d, %Y")
        event["time"] = DateTime.parse(e["start_time"]).strftime("%l:%M %p")
        event["venue_name"] = e["venue_name"]
        event["address"] = e["venue_address"]
        event["city"] = e["city"]
        event["state"] = e["region_name"]
        event["zip_code"] = e["postal_code"]
        event["country"] = e["country_name"]
        event["address_string"] = "#{event["address"]} #{event["city"]} #{event["state"]} #{event["zip_code"]} #{event["country"]}"

        events << event
      end
    rescue => error
      []
    end
    events
  end

  protected

  def self.sanitize_search_term_params(search_term)
    # add `return` to add clarity
    case search_term
      when "movies & films"
        return "movies_film"
      when "performing arts"
        return "performing_arts"
      when "kids & family"
        return "family_fun_kids"
      when "festivals"
        return "festivals_parades"
      when "food & wine"
        return "food"
      when "art galleries & exhibits"
         return "art"
      when "museums & attractions"
        return "attractions"
      when  "neigborhood activities"
        return "community"
      when "nightlife & singles"
        return "singles_social"
      when "outdoors & recreation"
        return "outdoors_recreation"
      else
        return search_term
      end
  end

end

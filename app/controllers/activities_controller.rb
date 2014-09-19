class ActivitiesController < ApplicationController

  EVENTFUL_API_SEARCH_TERMS = ["sports", "movies", "performing arts", "music", "museums & attractions", "festivals", "comedy", "conference", "neigborhood activities", "nightlife & singles", "art galleries & exhibits"]
  YELP_API_SEARCH_TERMS = ["resturants", "grocery", "stores", "malls", "food"]


  def getActivityData
    if EVENTFUL_API_SEARCH_TERMS.include?(activity_search_params[:searchTerm])
      @activities = EventfulApi.getData(activity_search_params)
       render "get_activity", collection: @activities
    elsif YELP_API_SEARCH_TERMS.include?(activity_search_params[:searchTerm])
    else
      flash.now[:notice] = "There seems to have been an error please choose your activity again"
    end
  end

  def create
    @activity = current_user.activities.new(activity_creation_params)
    if @activity.save
      flash.now[:notice] = "It Saved."
    else
      flash.now[:notice] = "Poo"
    end
  end


  protected

  def activity_search_params
    params.permit(:searchTerm, :searchDate, :searchLocation, :searchRadius)
  end

  def activity_creation_params
    params.permit(:name, :venue_name, :time, :location, :description)
  end



end

class ActivitiesController < ApplicationController

  EVENTFUL_API_SEARCH_TERMS = ["sports", "movies", "performing arts", "music", "museums & attractions", "festivals", "comedy", "conference", "neigborhood activities", "nightlife & singles", "art galleries & exhibits"]
  YELP_API_SEARCH_TERMS = ["resturants", "grocery", "stores", "malls", "food"]

  def getActivityData
    if EVENTFUL_API_SEARCH_TERMS.include?(activity_params[:searchTerm])
      @activities = EventfulApi.getData(activity_params)
       render "get_activity", collection: @activities
    elsif YELP_API_SEARCH_TERMS.include?(activity_params[:searchTerm])
    else
      flash.now[:notice] = "There seems to have been an error please choose your activity again"
    end
  end

  protected

  def activity_params
    params.permit(:searchTerm, :searchDate, :searchLocation, :searchRadius)
  end

end

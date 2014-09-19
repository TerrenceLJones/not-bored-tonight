class ActivitiesController < ApplicationController

  EVENTFUL_API_SEARCH_TERMS = ["sports", "movies & films", "performing arts", "music", "museums & attractions", "festivals", "comedy", "conference", "neigborhood activities", "nightlife & singles", "art galleries & exhibits",  "outdoors & recreation", "food & wine", "kids & family"]

  def getActivityData
    if EVENTFUL_API_SEARCH_TERMS.include?(activity_search_params[:searchTerm])
      @activities = EventfulApi.getData(activity_search_params)
       render "get_activity", collection: @activities
    else
      flash.now[:notice] = "There seems to have been an error please choose your activity again"
    end
  end

  def create
    @activity = current_user.activities.new(activity_creation_params)
    if @activity.save
      render "save_to_calendar_success"
    else
      render "save_to_calendar_failure"
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

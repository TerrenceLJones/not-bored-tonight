class ActivitiesController < ApplicationController
  skip_before_action :verify_authenticity_token

  EVENTFUL_API_SEARCH_TERMS = ["sports", "movies & films", "performing arts", "music", "museums & attractions", "festivals", "comedy", "conference", "neigborhood activities", "nightlife & singles", "art galleries & exhibits",  "outdoors & recreation", "food & wine", "kids & family"]

  def index
    @activities = []
    if EVENTFUL_API_SEARCH_TERMS.include?(params[:searchTerm])
      @activities = EventfulApi.getData(params)
    end

    if params[:isHeaderSearchSelector] == "true"
      if @activities.empty?
        flash[:notice] = "Sorry, but there were no results based on your search."
      end
      render :js => "window.location = '#{activities_path(params.merge(isHeaderSearchSelector:'false'))}'"
    else
      respond_to do |format|
        format.html
        format.js {
          if @activities.empty?
            flash.now[:notice] = "Sorry, but there were no results based on your search."
          end
          render "get_activity", collection: @activities
          }
      end
    end
  end

  def create
    @activity = current_user.activities.new(activity_creation_params)
    if @activity.save!
      render "save_to_calendar_success"
    else
      render "save_to_calendar_failure"
    end
  end

  def destroy
    Activity.find(params["id"]).delete
    @activities = Activity.all.where(user_id: current_user.id).all
    # flash[:notice] = "Your activity has been deleted."
    render "users/activities_update", collection: @activities
  end

  protected

  def activity_search_params
    params.permit(:searchTerm, :searchDate, :searchLocation, :searchRadius, :isHeaderSearchSelector)
  end

  def activity_creation_params
    params.permit(:name, :venue_name, :time, :location, :description)
  end

end

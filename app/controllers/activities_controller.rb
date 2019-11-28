class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, flash: {success: 'Activity was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity,flash: { success: 'Activity was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url,flash: { success: 'Activity was successfully destroyed.'} }
    end
  end

  def import
    Activity.import(params[:file])
    redirect_to activities_path, flash: {info: "Activities Added"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.fetch(:activity, {}).permit(:title, :description, :price, :image_url)
    end
end

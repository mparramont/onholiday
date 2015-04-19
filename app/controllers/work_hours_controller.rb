class WorkHoursController < ApplicationController
  before_action :set_fields, except: :index

  def index
    @day = Date.today
    if params[:date]
      @day = Date.parse(params[:date])
    end
    @work_hours = current_user.work_hours.where(day: @day.beginning_of_week..@day.end_of_week)
    @work_hours = @work_hours.to_json(only: [:hour, :day])
  end

  def add
    @work_hour = @user.work_hours.new(day: @day, hour: @hour)

    if @work_hour.save
      head :created
    else
      head :bad_request
    end
  end

  def remove
    @work_hours = @user.work_hours.where(day: @day, hour: @hour)
    @work_hours.destroy_all

    head :created
  end


  def set_fields
      @user = User.find(params[:user_id])
      @day = params[:day]
      @hour = params[:hour]
  end

end

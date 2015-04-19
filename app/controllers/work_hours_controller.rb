class WorkHoursController < ApplicationController
  before_action :set_fields, except: :index
  before_action :define_timetable_user, only: :index
  before_action :define_timetable_day, only: :index

  def index
    @work_hours = @timetable_user.work_hours.where("day between ? and ?",  @day.beginning_of_week, @day.end_of_week)
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

 private
  def set_fields
      @user = User.find(params[:user_id])
      @day = params[:day]
      @hour = params[:hour]
  end

  def define_timetable_user
    if current_user.admin?
      @timetable_user = User.find(params[:user_id]) if params[:user_id]
      redirect_to admin_users_path if @timetable_user.nil?
    end
    @timetable_user = @timetable_user || current_user
  end

  def define_timetable_day
    @day = Date.today
    if params[:date]
      @day = Date.parse(params[:date])
    end
  end

end

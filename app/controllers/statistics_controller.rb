class StatisticsController < ApplicationController
  before_action :authenticate_user!
  require 'gchart'

  def index
    days_worked =  current_user.work_hours.group(:day).count.count
    vacations = current_user.vacation_requests.all
    days_off = vacations.inject(0){|sum,v| sum += (v[:end] - v[:start]) }

    @chart = Gchart.pie(:size => '400x300',
                :title_color => 'FF0000',
                :bg => 'FFFFFF',
                :legend => ['Worked days', 'Vacation days'],
                :data => [days_worked, days_off],
                :bar_colors => ['0000FF', '00FF00'])
  end
end

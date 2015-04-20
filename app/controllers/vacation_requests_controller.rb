class VacationRequestsController < ApplicationController
  before_action :authenticate_user!


    def index
      @new_vacation_request =  current_user.vacation_requests.new
      @vacation_requests = VacationRequest.all
    end

    def create
      @vacation_request = VacationRequest.create(vacation_request_params)
      if @vacation_request.save
        flash[:notice] = "Successfully requested a annual leave"
        redirect_to vacation_requests_path
      else
        flash[:warning] = "Could not request annual leave"
        redirect_to vacation_requests_path
      end
    end

    def destroy
      @vacation_request = VacationRequest.find(params[:id])
      @vacation_request.destroy

      redirect_to vacation_requests_path
    end

    def vacation_request_params
      params.require(:vacation_request).permit(:start,:end,:reason, :user_id)
    end
end

module Api
  class RacersController < ApplicationController


    def index
      if !request.accept || request.accept == "*/*"
        render plain: api_racers_path
      end
    end

    def show
      # if !request.accept || request.accept == "*/*"
      #   render plain: "/api/racers/#{params[:racer_id]}"
      # else
      #   @races=@racer.races
      #   render json: @racers, status:200
      # end
      if !request.accept || request.accept == "*/*"
         render plain: api_racer_path(params[:id])
      end
    end



    private

      # Never trust parameters from the scary internet, only allow the white list through.
      def racer_params
        params.require(:racer).permit(:first_name, :last_name, :gender, :birth_year, :city, :state)
      end
  end
end

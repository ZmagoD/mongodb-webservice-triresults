module Api
  class RacersController < ApplicationController
    before_action :set_racer, only: [:show, :edit, :update, :destroy]

    def index
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers"
      else
        @racers = Racer.all
      end
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers/#{params[:racer_id]}"
      else
        @races=@racer.races
      end
    end

    def create
      @racer = Racer.create(racer_params)
    end

    def update
      @racer.update(racer_params)
    end

    def destroy
      @racer.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_racer
        @racer = Racer.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def racer_params
        params.require(:racer).permit(:first_name, :last_name, :gender, :birth_year, :city, :state)
      end
  end
end

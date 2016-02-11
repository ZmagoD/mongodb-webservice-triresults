module Api
  class RacesController < ApplicationController
    before_action :set_race, only: [:show, :edit, :update, :destroy]

    def index
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races"
      else
        @races = Race.all.order_by(date: :desc)
      end
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races/#{params[:race_id]}"
      else
        @entrants = Entrant.where(:"race._id"=>@race.id).order_by(secs: :asc, last_name: :asc, first_name: :asc).to_a
      end
    end

    def create
      @race = Race.create(race_params)
    end

    def update
      @race.update(race_params)
    end

    def destroy
      @race.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_race
        @race = Race.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def race_params
        params.require(:race).permit(:name, :date, :city, :state, :swim_distance, :swim_units, :bike_distance, :bike_units, :run_distance, :run_units)
      end
  end
end

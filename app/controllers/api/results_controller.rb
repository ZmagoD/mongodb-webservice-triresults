module Api
  class ResultsController < ApplicationController

    def index
      if !request.accept || request.accept == "*/*"
        render plain: api_race_results_path(params[:race_id])
      end
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: api_race_result_path(params[:race_id], params[:id])
      else
        @result=Race.find(params[:race_id]).entrants.where(:id=>params[:id]).first
        render :partial=>"result", :object=>@result
      end
    end
  end
end

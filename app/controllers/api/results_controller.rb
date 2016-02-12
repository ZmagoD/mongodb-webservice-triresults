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
      end
    end
  end
end

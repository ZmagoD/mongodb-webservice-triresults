module Api
  class EntriesController < ApplicationController

    def index
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}"
      else
      #real implementation ...
        byebug
      end
    end

    def update
    end
  end
end

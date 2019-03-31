class MostDangerousDayController < ApplicationController
  def index
    render locals: {
      asteroid_facade: AsteroidFacade.new(params[:start_date], params[:end_date])
    }
  end
end

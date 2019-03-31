module Api
  module V1
    module User
      class FavoritesController < ApiBaseController
        def index
          favorites = Favorite.get_favorites(params[:api_key])
          # binding.pry
          render :json => favorites, each_serializer: FavoritesSerializer
          # render json: FavoritesSerializer.new(favorites)
        end
      end
    end
  end
end

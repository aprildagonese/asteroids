class Favorite < ApplicationRecord
  belongs_to :user

  def self.get_favorites(api_key)
    x = Favorite.joins(user: :api_key)
            .select("favorites.*")
            .where(api_keys: {value: api_key})
  end
end

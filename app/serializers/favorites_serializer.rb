class FavoritesSerializer < ActiveModel::Serializer
  attributes :id, :neo_reference_id, :user_id, :asteroid
  binding.pry
  def asteroid
    {
      name: "Asteroid Name",
      is_potentially_hazardous_asteroid: "Asteroid hazard?"
    }
  end
end

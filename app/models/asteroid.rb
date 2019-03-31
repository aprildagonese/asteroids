class Asteroid
  attr_reader :date, :name, :id, :hazardous

  def initialize(data)
    @name = data[:name]
    @id = data[:neo_reference_id]
    @hazardous = data[:is_potentially_hazardous_asteroid]
    @date = data[:close_approach_data][0][:close_approach_date]
  end
end

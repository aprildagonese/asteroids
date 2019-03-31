class NasaService
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def most_dangerous_date
    most_dangerous.first
  end

  def asteroid_threats_by_date
    most_dangerous[1]
  end

  def most_dangerous
    threats_by_date.max_by do |date, asteroids|
      asteroids.count
    end
  end

  def threats_by_date
    actual_threats.group_by do |asteroid|
      asteroid.date
    end
  end

  def actual_threats
    get_asteroids.select do |asteroid|
      asteroid.hazardous == true
    end
  end

  def get_asteroids
    @asteroids = []
    get_asteroid_data[:near_earth_objects].each do |date, data|
      data.each do |asteroid|
        @asteroids << Asteroid.new(asteroid)
      end
    end
    @asteroids
  end

  def get_asteroid_data
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{@start_date}&end_date=#{@end_date}&api_key=#{ENV['NASA_API_KEY']}")
    raw_data = JSON.parse(response.body, symbolize_names: true)
  end

end

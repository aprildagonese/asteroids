class AsteroidFacade
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def query_dates
    "#{prettify_date(@start_date.to_date)} - #{prettify_date(@end_date.to_date)}"
  end

  def asteroids
    service.asteroid_threats_by_date
  end

  def most_dangerous_day
    prettify_date(service.most_dangerous_date.to_date)
  end

  def prettify_date(date)
    date.strftime("%B %e, %Y")
  end

  def service
    NasaService.new(@start_date, @end_date)
  end
end

class DriversData
  delegate :h, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        aaData: data
    }
  end

  private

  def data
    drivers.map do |driver|
      [
          h(driver.id),
          h(driver.name)
      ]
    end
  end

  def drivers
    @drivers = Driver.order("name").all
  end


end
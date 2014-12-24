class Stock < ActiveRecord::Base

  has_many :investments

  def price_2000
    initial_value
  end
  
  def price(year)
    if valid_years.include? year
      send("price_#{year}")
    end
  end

  private
  
  def valid_years
    [2000, 2002, 2007]
  end
  
end

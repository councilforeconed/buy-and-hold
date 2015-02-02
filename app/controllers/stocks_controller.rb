class StocksController < ApplicationController
  def index
    @stocks = Stock.all
    @year = current_year
    @date = current_date
  end

  private

  def current_date
    case current_year
    when 2000
      "2000-01-03"
    when 2002
      "2002-09-23"
    when 2007
      "2007-10-01"
    else
      nil
    end
  end
end

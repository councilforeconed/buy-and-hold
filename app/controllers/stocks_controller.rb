class StocksController < ApplicationController
  def index
    @stocks = Stock.all
    @year = current_year
  end
end

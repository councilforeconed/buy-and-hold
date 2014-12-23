require 'test_helper'

class StockTest < ActiveSupport::TestCase

  def setup
    @stock = Stock.first
  end

  test "price_2000 is an alias to initial price" do
    assert_equal @stock.initial_value, @stock.price_2000
  end

  test "#price can take a year as an argument" do
    assert_equal @stock.price(2000), @stock.price_2000
    assert_equal @stock.price(2002), @stock.price_2002
    assert_equal @stock.price(2007), @stock.price_2007
  end

  test "#price will return nil with an invalid year" do
    refute @stock.price(9999)
  end

end

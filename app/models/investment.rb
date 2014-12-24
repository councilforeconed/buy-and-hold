class Investment < ActiveRecord::Base

  belongs_to :student
  belongs_to :stock

  def company
    stock.company
  end

  def symbol
    stock.symbol
  end

  def initial_value
    stock.initial_value
  end

  def value_in(year)
    stock.price(year) * quantity
  end

end

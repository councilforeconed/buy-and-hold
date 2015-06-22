require 'yaml'

Stock.create(company: "Bonds", symbol: "Bonds", initial_value: 50, price_2002: 54, price_2007: 63)

YAML.load(File.read('./data/stocks.yml')).each do |stock|
  Stock.create(stock)
end


require 'yaml'

Stock.create(company: "Bonds", symbol: "Bonds", initial_value: 1, price_2002: 1.08, price_2007: 1.26)

YAML.load(File.read('./data/stocks.yml')).each do |stock|
  Stock.create(stock)
end


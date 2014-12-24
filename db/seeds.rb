require 'yaml'

YAML.load(File.read('./data/stocks.yml')).each do |stock|
  Stock.create(stock)
end


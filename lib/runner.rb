require 'CSV'
require './lib/merchants'
require './lib/items'

sales_engine = SalesEngine.from_csv({
  :items     => "./data/items.csv",
  :merchants => "./data/merchants.csv",
})

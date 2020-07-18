class SalesEngine
  attr_reader :items,
              :merchants
  def initialize(data)
        @items = data["./data/items.csv"]
    @merchants = data["./data/merchants.csv"]
  end


end

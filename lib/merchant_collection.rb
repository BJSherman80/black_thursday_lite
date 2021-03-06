require 'CSV'
require 'pry'
require './lib/merchant'

class MerchantCollection
  def initialize(filepath)
    @merchants = []
    load_merchants(filepath)
  end

  def all
    @merchants
  end


  def load_merchants(filepath)
    CSV.foreach(filepath, headers: true, header_converters: :symbol) do |data|
      @merchants << Merchant.new(data)
    end
  end

  def find_by_id(id)
    @merchants.find do |merchant|
      merchant.id == id
    end
  end



end

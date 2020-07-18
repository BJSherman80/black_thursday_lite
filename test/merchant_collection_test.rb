require 'minitest/autorun'
require 'minitest/pride'
require './lib/merchant_collection'

class MerchantCollectiontest < Minitest::Test

  def test_it_exists
    merchant_collection = MerchantCollection.new("./data/merchants.csv")

    assert_instance_of MerchantCollection, merchant_collection
  end


  def test_a_merchant_repo_has_merchants
    merchant_collection = MerchantCollection.new('./test/fixtures/merchants.csv')

    assert_equal 4, merchant_collection.all.count
    assert_instance_of Array, merchant_collection.all
    assert merchant_collection.all.all? { |merchant| merchant.is_a? (Merchant)}
    assert_equal "Shopin1901", merchant_collection.all.first.name

  end

  def test_it_returns_nil_when_no_find_match
    merchant_collection = MerchantCollection.new('./test/fixtures/merchants.csv')


    result = merchant_collection.find_by_id(23423423)

    assert_nil result
  end

  def test_it_can_find_merchant_by_id
    merchant_collection = MerchantCollection.new('./test/fixtures/merchants.csv')

    result = merchant_collection.find_by_id(1)
    assert_instance_of Merchant, result
    assert_equal "Shopin1901", result.name
    assert_equal 1, result.id
  end
end

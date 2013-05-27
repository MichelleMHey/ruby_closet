require_relative 'test_helper'

class TestListingClothes < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_clothing_names
    assert Clothing.all.empty?
    actual = `ruby testcloset list`
    assert_equal "", actual
  end

  def test_listing_multiple_clothing_names
    Clothing.create(name: 'Jeans')
    Clothing.create(name: 'Dress')
    actual = `ruby testcloset list`
    expected = <<EOS
1. Jeans
2. Dress
EOS
    assert_equal expected, actual
  end
end
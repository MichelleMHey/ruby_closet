require_relative 'test_helper'

class TestListingClothes < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_05_listing_when_there_are_no_projects
    assert Clothing.all.empty?
    actual = `ruby testcloset list`
    assert_equal "", actual
  end

  def test_06_listing_multiply_projects
    Clothing.create(name: 'Dress')
    Clothing.create(name: 'Pants')
    actual = `ruby testcloset list`
    expected = <<EOS
1. Dress
2. Pants
EOS
    assert_equal expected, actual
  end
end
require 'test_helper'

class TestRemovingClothes < MiniTest::Unit::TestCase
  include DatabaseCleaner
  
  def test_07_remove_only_clothing
    Clothing.create( name: 'Dress')
    `ruby testcloset remove "Dress"`
    assert Clothing.all.empty?
  end
end
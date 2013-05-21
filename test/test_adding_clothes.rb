require 'test_helper'

class TestAddingClothes < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_01_adding_clothes_and_saves_them
    assert_equal 0, Clothing.count
    `ruby testcloset add Dress`
    assert_equal 1, Clothing.count
  end

  def test_02_takes_clothes_and_uses_them
    `ruby testcloset add Dress`
    assert_equal 'Dress', Clothing.last
  end

  def test_03_duplicate_names_are_ignored
    Clothing.create( name: 'Dress' )
    original_clothes_count = Clothing.count
    `ruby testcloset add Dress`
    assert_equal original_clothes_count, Clothing.count
  end
 
  def test_04_duplicate_names_outputs_error_message
    Clothing.create( name: 'Dress' )
    results = `ruby testcloset add Dress`
    assert results.include?("Name already exists!"), "Actually was '#{results}'"
  end
end
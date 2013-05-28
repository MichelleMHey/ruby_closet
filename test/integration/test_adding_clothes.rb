require '../test_helper'

class TestAddingClothes < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_take_clothing_names_and_saves_it
    assert_equal 0, Clothing.count
    `ruby rubycloset add Jeans`
    assert_equal 1, Clothing.count  
  end

  def test_take_clothing_names_and_uses_them
    `ruby rubycloset add Jeans`
    assert_equal 'Jeans', Clothing.last.name
  end

  def test_duplicate_clothing_names_are_ignored
    Clothing.create( name: 'Jeans' )
    original_clothing_count = Clothing.count
    `ruby rubycloset add Jeans`
    assert_equal original_clothing_count, Clothing.count
  end

  def test_duplicate_clothing_names_outputs_error_message
    Clothing.create( name: 'Jeans' )
    results = `ruby rubycloset add Jeans`
    assert results.include?('Clothing already exists!'), "Actually was '#{results}'"
  end
end
require 'test_helper'

class TestRemovingClothes < MiniTest::Unit::TestCase
  include DatabaseCleaner
  
  def test_remove_only_one_clothing_name
    Clothing.create( name: 'only child')
    `ruby testcloset remove "only child"`
    assert Clothing.all.empty?
  end

  def test_remove_particular_piece_of_clothing
    Clothing.create( name: 'a' )
    Clothing.create( name: 'b' )
    Clothing.create( name: 'c' )
    assert !Clothing.where( name: 'b').all.empty?
    `ruby testcloset remove b`
    assert Clothing.where( name: 'b').all.empty?
  end

  def test_remove_particular_clothing_doesnt_remove_all
    assert Clothing.all.empty?
    Clothing.create( name: 'a' )
    Clothing.create( name: 'b' )
    Clothing.create( name: 'c' )
    assert !Clothing.where( name: 'b' ).all.empty?
    `ruby testcloset remove b`
    assert_equal 2, Clothing.count
  end
end
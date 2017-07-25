require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'

class MuseumTest < Minitest::Test
  def test_it_exists
    museum = Museum.new({name: "Tate Modern"})

    assert_instance_of Museum, museum
  end

  def test_it_has_an_id
    museum = Museum.new({name: "Museo de Arte Moderno"})

    assert_equal 1, museum.id
  end

  def test_it_has_a_name
    museum = Museum.new({name: "MoMA"})

    assert_equal "MoMA", museum.name
  end

  def test_it_knows_about_all_museums
    museum_1 = Museum.new({name: "MoMA"})
    museum_2 = Museum.new({name: "The Whitney"})

    assert_equal [museum_1, museum_2], Museum.all
  end

  def test_it_knows_the_count_of_all_museums
    Museum.new({name: "MoMA"})
    Museum.new({name: "The Whitney"})

    assert_equal 2, Museum.count
  end
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < Minitest::Test
  def test_it_exists
    photograph = Photograph.new({name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 1, museum_id: 1, year: 1954})

    assert_instance_of Photograph, photograph
  end

  def test_it_has_an_id
    photograph = Photograph.new({name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 1, museum_id: 1, year: 1954})

    assert_equal 1, photograph.id
  end

  def test_it_has_a_name
    photograph = Photograph.new({name: "Moonrise, Hernandez", artist_id: 2, museum_id: 1, year: 1941})

    assert_equal "Moonrise, Hernandez", photograph.name
  end

  def test_it_has_an_artist_id
    photograph = Photograph.new({name: "Identical Twins, Roselle, New Jersey", artist_id: 3, museum_id: 1, year: 1967})

    assert_equal 3, photograph.artist_id
  end

  def test_it_has_a_museum_id
    photograph = Photograph.new({name: "Allie Mae Burroughs", artist_id: 4, museum_id: 1, year: 1936})

    assert_equal 1, photograph.museum_id
  end

  def test_it_has_a_year
    photograph = Photograph.new({name: "Obrero en huelga asesinado", artist_id: 5, museum_id: 1, year: 1934})

    assert_equal 1934, photograph.year
  end

  def test_it_knows_about_all_photographs_created
    photograph_1 = Photograph.new({name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 1, museum_id: 1, year: 1954})
    photograph_2 = Photograph.new({name: "Moonrise, Hernandez", artist_id: 2, museum_id: 1, year: 1941})

    assert_equal [photograph_1, photograph_2], Photograph.all
  end

  def test_it_can_count_all_photographs_created
    Photograph.new({name: "Rue Mouffetard, Paris (Boy with Bottles)", artist_id: 1, museum_id: 1, year: 1954})
    Photograph.new({name: "Moonrise, Hernandez", artist_id: 2, museum_id: 1, year: 1941})

    assert_equal 2, Photograph.count
  end
end

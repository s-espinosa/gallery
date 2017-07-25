require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_holds_museum
    curator = Curator.new

    assert_equal Museum, curator.museum
  end

  def test_it_holds_photograph
    curator = Curator.new

    assert_equal Photograph, curator.photograph
  end

  def test_it_holds_artist
    curator = Curator.new

    assert_equal Artist, curator.artist
  end

  def test_it_can_find_a_museum_by_id
    curator = Curator.new
    Museum.new({name: "Tate Modern"})

    museum = curator.find_museum(1)

    assert_equal "Tate Modern", museum.name
  end

  def test_it_can_find_an_artist_by_id
    curator = Curator.new
    Artist.new({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})

    artist = curator.find_artist(1)

    assert_equal "Ansel Adams", artist.name
  end

  def test_it_can_find_a_museum_that_holds_a_photograph
    curator = Curator.new
    photograph = Photograph.new({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    Artist.new({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    Museum.new({name: "Tate Modern"})

    museum = curator.find_museum_by_photograph(photograph)

    assert_equal "Tate Modern", museum.name
  end

  def test_it_can_find_an_artist_that_took_a_photograph
    curator = Curator.new
    photograph = Photograph.new({name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})
    Artist.new({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
    Museum.new({name: "Tate Modern"})

    artist = curator.find_artist_by_photograph(photograph)

    assert_equal "Ansel Adams", artist.name
  end
end

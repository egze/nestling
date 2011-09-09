require File.join(File.dirname(__FILE__), 'helper')

class TestSong < MiniTest::Unit::TestCase
  include Nestling

  METHODS = Song::METHODS

  def test_superclass
    assert_equal Base, Song.superclass
  end

  def test_method_prefix
    assert_equal "song/", Song::METHOD_PREFIX
  end

  def test_number_of_methods
    assert_equal 3, METHODS.length
  end

  def test_search
    assert METHODS[:search][:collection]
    assert_equal "songs", METHODS[:search][:key]
  end

  def test_profile
    assert METHODS[:profile][:collection]
    assert_equal "songs", METHODS[:profile][:key]
  end

  def test_identify
    assert METHODS[:identify][:collection]
    assert_equal "songs", METHODS[:identify][:key]
  end
end


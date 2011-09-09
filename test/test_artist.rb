require File.join(File.dirname(__FILE__), 'helper')

class TestArtist < MiniTest::Unit::TestCase
  include Nestling

  METHODS = Artist::METHODS

  def setup
    @collection_response = <<-EOS
      {"response": {
        "status": {
          "version": "4.2",
          "code": 0,
          "message": "Success"
        },
        "start": 11,
        "total": 1393,
        "session_id": 123,
        "audio": [{
          "title": "foo",
          "date": "2011-08-16T01:15:01"
        }]
      }}
    EOS
  end

  def test_superclass
    assert_equal Base, Artist.superclass
  end

  def test_method_prefix
    assert_equal "song/", Song::METHOD_PREFIX
  end

  def test_number_of_methods
    assert_equal 20, METHODS.length
  end

  def test_artist_with_id
    artist = Client.new('foo').artist :id => 'foo'
    assert_equal 'foo', artist.id
    assert_nil artist.name
  end

  def test_artist_with_name
    artist = Client.new('foo').artist 'bar'
    assert_equal 'bar', artist.name
    assert_nil artist.id
  end

  def test_passes_name
    expect_request @collection_response, 'artist/audio', { :name => 'bar' }
    Client.new('foo').artist('bar').audio
  end

  def test_passes_id
    expect_request @collection_response, 'artist/audio', { :id => 'baz' }
    Client.new('foo').artist(:id => 'baz').audio
  end

  def test_audio
    assert METHODS[:audio][:collection]
    assert_nil METHODS[:audio][:key]
  end

  def test_biographies
    assert METHODS[:biographies][:collection]
    assert_nil METHODS[:biographies][:key]
  end

  def test_blogs
    assert METHODS[:blogs][:collection]
    assert_nil METHODS[:blogs][:key]
  end

  def test_familiarity
    refute METHODS[:familiarity][:collection]
    assert_equal "artist", METHODS[:familiarity][:key]
  end

  def test_hotttnesss
    refute METHODS[:hotttnesss][:collection]
    assert_equal "artist", METHODS[:hotttnesss][:key]
  end

  def test_images
    assert METHODS[:images][:collection]
    assert_nil METHODS[:images][:key]
  end

  def test_list_terms
    assert METHODS[:list_terms][:collection]
    assert_nil METHODS[:list_terms][:key]
  end

  def test_news
    assert METHODS[:news][:collection]
    assert_nil METHODS[:news][:key]
  end

  def test_profile
    refute METHODS[:profile][:collection]
    assert_equal "artist", METHODS[:profile][:key]
  end

  def test_reviews
    assert METHODS[:reviews][:collection]
    assert_nil METHODS[:reviews][:key]
  end

  def test_search
    assert METHODS[:search][:collection]
    assert_equal "artists", METHODS[:search][:key]
  end

  def test_extract
    assert METHODS[:extract][:collection]
    assert_equal "artist", METHODS[:extract][:key]
  end

  def test_songs
    assert METHODS[:songs][:collection]
    assert_nil METHODS[:songs][:key]
  end

  def test_similar
    assert METHODS[:similar][:collection]
    assert_equal "artists", METHODS[:similar][:key]
  end

  def test_suggest
    assert METHODS[:suggest][:collection]
    assert_equal "artists", METHODS[:suggest][:key]
  end

  def test_terms
    assert METHODS[:terms][:collection]
    assert_nil METHODS[:terms][:key]
  end

  def test_top_hottt
    assert METHODS[:top_hottt][:collection]
    assert_equal "artists", METHODS[:top_hottt][:key]
  end

  def test_top_terms
    assert METHODS[:top_terms][:collection]
    assert_equal "terms", METHODS[:top_terms][:key]
  end

  def test_urls
    refute METHODS[:urls][:collection]
    assert_nil METHODS[:urls][:key]
  end

  def test_video
    assert METHODS[:video][:collection]
    assert_nil METHODS[:video][:key]
  end
end


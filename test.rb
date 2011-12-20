require 'test/unit'
class TestCookbookName < Test::Unit::TestCase
  def test_file_exists
    assert_equal true, File.exists?("/etc/apt/source")
  end
end

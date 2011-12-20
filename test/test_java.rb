require 'test/unit'
class TestJavaInstallation < Test::Unit::TestCase
  def test_file_exists
    assert_equal true, File.exists?("/usr/lib/jvm/java-6-sun")
  end
end

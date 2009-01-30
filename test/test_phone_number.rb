require File.dirname(__FILE__) + '/test_helper.rb'

class TestPhoneNumber < Test::Unit::TestCase

  def setup
  end

  def test_parse_country_code
    assert_equal "1", PhoneNumber.new("1234567890").country_code
    assert_equal "49", PhoneNumber.new("+49-89-343 80-14").country_code
    assert_equal "598", PhoneNumber.new("59811111111").country_code
  end

  def test_countries
    assert_equal "DE", PhoneNumber.new("+49-89-343 80-14").country
    assert_equal "UY", PhoneNumber.new("59811111111").country
  end

end

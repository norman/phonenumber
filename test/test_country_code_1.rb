require File.dirname(__FILE__) + '/test_helper.rb'

class TestCountryCode1 < Test::Unit::TestCase
  
  def setup
    @phone_number = PhoneNumber.new("16041234567")
  end
  
  def test_country
    assert_equal "CA", @phone_number.country
  end
  
  def test_region
    assert_equal "BC", @phone_number.region
  end

  def test_area_code
    assert_equal "604", @phone_number.area_code
  end
  
  def test_prefix
    assert_equal "123", @phone_number.prefix
  end
  
  def test_line_number
    assert_equal "4567", @phone_number.line_number
  end

end
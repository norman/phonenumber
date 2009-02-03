require File.dirname(__FILE__) + '/test_helper.rb'

class TestCountryCode1 < Test::Unit::TestCase


  context "A Vancouver phone number" do
    setup { @phone_number = PhoneNumber.new("1-604-123-4567") }
    area_code_should_be "604"
    city_should_be "Vancouver"
    country_code_should_be "1"
    country_should_be "CA"
    line_number_should_be "4567"
    prefix_should_be "123"
    real_number_should_be "6041234567"
    region_should_be "BC"
  
    should "have a default format" do
      assert_equal "(604) 123-4567", @phone_number.format
    end
  
  end

end
require File.dirname(__FILE__) + '/test_helper.rb'

class TestCountryCode54 < Test::Unit::TestCase
  
  context "A Buenos Aires phone number" do
    setup { @phone_number = PhoneNumber.new("54-11-4444-3333") }
    area_code_should_be "11"
    city_should_be "Buenos Aires"
    country_code_should_be "54"
    country_should_be "AR"
    line_number_should_be "3333"
    local_prefix_should_be nil
    prefix_should_be "4444"
    real_number_should_be "1144443333"
    real_number_without_local_prefix_should_be "1144443333"
    region_should_be "C"
    default_format_should_be "011 4444 3333"
  end

  context "A Buenos Aires cell number" do
    setup { @phone_number = PhoneNumber.new("11-15-5555-4444", "54") }
    area_code_should_be "11"
    city_should_be "Buenos Aires"
    country_code_should_be "54"
    country_should_be "AR"
    line_number_should_be "4444"
    local_prefix_should_be "15"
    prefix_should_be "5555"
    real_number_should_be "111555554444"
    real_number_without_local_prefix_should_be "1155554444"
    region_should_be "C"
    default_format_should_be "011 15 5555 4444"
  end

  context "A Buenos Aires cell number dialed from abroad" do
    setup { @phone_number = PhoneNumber.new("54-911-5555-4444") }
    area_code_should_be "11"
    city_should_be "Buenos Aires"
    country_code_should_be "54"
    country_should_be "AR"
    line_number_should_be "4444"
    local_prefix_should_be "9"
    prefix_should_be "5555"
    real_number_should_be "91155554444"
    real_number_without_local_prefix_should_be "1155554444"
    region_should_be "C"
  end

  context "A Bahía Blanca phone number" do
    setup { @phone_number = PhoneNumber.new("54-291-444-3333") }
    area_code_should_be "291"
    city_should_be "Bahía Blanca"
    country_code_should_be "54"
    country_should_be "AR"
    line_number_should_be "3333"
    local_prefix_should_be nil
    prefix_should_be "444"
    real_number_should_be "2914443333"
    real_number_without_local_prefix_should_be "2914443333"
    region_should_be "B"
    default_format_should_be "0291 444 3333"
  end

  context "A Bariloche phone number" do
    setup { @phone_number = PhoneNumber.new("54-2944-444-333") }
    area_code_should_be "2944"
    city_should_be "San Carlos de Bariloche"
    country_code_should_be "54"
    country_should_be "AR"
    line_number_should_be "333"
    local_prefix_should_be nil
    prefix_should_be "444"
    real_number_should_be "2944444333"
    real_number_without_local_prefix_should_be "2944444333"
    region_should_be "R"
    default_format_should_be "02944 444 333"
  end

end
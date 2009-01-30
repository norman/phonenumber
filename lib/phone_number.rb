require 'phone_number/country_code'
require 'phone_number/country_code/base'

class PhoneNumber
  
  attr :number
  # attr :area_code
  # attr :prefix
  # attr :line_number
  # attr :region
  # attr :country

  def initialize(number, country_iso = nil)
    @number ||= number.to_s.gsub(/[^\d]/, '')
  end

  # The phone number's country code. For example:
  #
  #  +1 (xxx) xxx-xxxx
  def country_code
    @country_code ||= parse_country_code
  end
  
  # The phone number's area code. For example:
  #
  # +x (111) xxx-xxxx
  def area_code
    @area_code ||= prefix_class.area_code(self)
  end

  # The phone number's prefix. For example:
  #
  # +x (xxx) 111-xxxx
  def prefix
    @prefix ||= prefix_class.prefix(self)
  end

  # The phone number's line number. For example:
  #
  # +x (xxx) xxx-1111
  def line_number
    @line_number ||= prefix_class.line_number(self)
  end
  
  # If available, the geographical region (state, province, etc.) the phone
  # number belongs to.
  def region
    @area_code ||= prefix_class.region(self)
  end

  # The country the phone number belongs to.
  def country
    @country ||= prefix_class.country(self)
  end

  # Returns an array of countries this phone number could possibly be from.
  # For some phone numbers may be as granular as we'll be able to get.
  def countries
    CountryCode::PREFIXES[country_code]
  end

  private

  def prefix_class
    @prefix_class ||= CountryCode::class_for(country_code)
  end

  def parse_country_code
    (1..3).each {|i| return @number.slice(0,i) if CountryCode::PREFIXES[@number.slice(0,i)]}
  end

end
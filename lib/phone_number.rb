require 'phone_number/country_code'
require 'phone_number/country_code/base'

class PhoneNumber

  attr :number

  PIECES_MAP = {
    :area_code    => 'a',
    :country_code => 'c',
    :line_number  => 'l',
    :local_prefix => 'o',
    :prefix       => 'p'
  }
  
  class << self

    def format(phone_number, format = nil)
      num = phone_number.number
      str = (format or CountryCode::class_for(phone_number.country_code).default_format).clone
      PIECES_MAP.each do |piece, abbrev|
        str.gsub!("%#{abbrev}", phone_number.send(piece) || '')
      end
      str.gsub(/\s+/, ' ')
    end
  
  end


  def initialize(number, country_code = nil)
    @number ||= number.to_s.gsub(/[^\d]/, '')
    @country_code ||= country_code
  end

  # The phone number's country code. For example: +1 (xxx) xxx-xxxx
  def country_code
    @country_code ||= parse_country_code
  end

  # Returns an array of countries this phone number could possibly be from.
  # For some phone numbers this may be as granular as we'll be able to get.
  def countries
    CountryCode::CODES[country_code]
  end
  
  def format(format = nil)
    PhoneNumber::format(self, format)
  end


  def method_missing(symbol) #
    memo[symbol] ||= country_code_class.send(symbol, self)
  end

  private

  def memo
    @memo ||= {}
  end

  def country_code_class
    @country_code_class ||= CountryCode::class_for(country_code)
  end

  def parse_country_code
    (1..3).each {|i| return @number.slice(0,i) if CountryCode::CODES[@number.slice(0,i)]}
  end

end
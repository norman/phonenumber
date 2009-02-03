require 'rubygems'
require 'test/unit'
require 'shoulda'
require File.dirname(__FILE__) + '/../init'

class Test::Unit::TestCase

  pieces = ['area_code', 'country_code', 'real_number', 'country', 'city',
    'region', 'real_number_without_local_prefix', 'prefix', 'line_number',
    'local_prefix']
    
  pieces.each do |piece|
    self.class.send(:define_method, :"#{piece}_should_be") do |*args|
      should "have #{piece.gsub('_', ' ')} \"#{args.first}\"" do
        assert_equal args.first, @phone_number.send(piece.to_sym)
      end
    end
  end
  
  def self.default_format_should_be(arg)
    should "be formatted as #{arg} by default" do
      assert_equal arg, @phone_number.format
    end
  end

end
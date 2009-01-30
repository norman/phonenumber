module CountryCode
  
  class Base
    
    class << self

      def country(phone_number)
        phone_number.countries.first
      end

    end
  
  end

end
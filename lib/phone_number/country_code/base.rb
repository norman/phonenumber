module CountryCode

  # A base country code class. This is here simply to guide developers in
  # implementing drivers for their country's phone numbering system, and to
  # provide a place to document the varios methods that the PhoneNumber class
  # delegates to the various country code drivers.
  class Base

    class << self

      # The phone number's area code. For example:  +x (111) xxx-xxxx
      def area_code(phone_number)
        ""
      end

      # An array of cities that the phone number could belong to.
      def cities(phone_number)
        []
      end

      # The city, or a major city that this phone number belongs to.
      def city(phone_number)
        ""
      end

      # The ISO code for the country the phone number belongs to. For example, "US".
      def country(phone_number)
        phone_number.countries.first
      end

      # The phone number's line number. For example: +x (xxx) xxx-1111
      def line_number(phone_number)
        ""
      end

      # The phone number's prefix. For example: +x (xxx) 111-xxxx
      def prefix(phone_number)
        ""
      end

      # The phone number with country code and any international dialing
      # prefix removed. This is basically the number that the person would
      # consider to be "their phone number."
      #
      # For example:
      #
      #    +x (111) 111-1111
      def real_number(phone_number)
        ""
      end
      
      # If available, the geographical region (state, province, etc.) the
      # phone number is from.
      def region(phone_number)
      end
      
      # Some countries have local prefixes before the area code or prefix to
      # indicate, for example, that you are dialing a mobile phone. See the
      # country code class for Argentina (54) for an example.
      def local_prefix(phone_number)
        ""
      end

    end

  end

end
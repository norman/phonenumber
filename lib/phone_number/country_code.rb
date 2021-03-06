module CountryCode

  class UnsupportedCountryCodeError < StandardError ; end

  class << self
    def class_for(prefix)
      if File.exist?(File.dirname(__FILE__) + "/country_code/country_code_#{prefix}.rb")
        require "phone_number/country_code/country_code_#{prefix}"
        CountryCode::const_get "CountryCode#{prefix}".to_sym
      else
        CountryCode::Base
      end
    end
    
    # Return the numeric country code for the given ISO.
    def code(iso)
      CODES.select {|x| x[1].include?(iso)}[0][0]
    rescue NoMethodError
      nil
    end
    
    
  end

  # Maps numeric country prefix to country ISO's. Taken from {Wikipedia}[http://en.wikipedia.org/wiki/List_of_country_calling_codes].
  CODES = {
    "1"   => ["US", "CA", "BS", "BB", "AI", "AG", "VG", "VI", "KY", "BM", "GD", "TC", "MS", "MP", "GU", "AS", "LC", "DM", "VC", "PR", "DO", "DO", "TT", "KN", "JM", "PR"],
    "20"  => ["EG"],
    "210" => [],
    "211" => [],
    "212" => ["MA", "EH"],
    "213" => ["DZ"],
    "214" => [],
    "215" => [],
    "216" => ["TN"],
    "217" => [],
    "218" => ["LY"],
    "219" => [],
    "220" => ["GM"],
    "221" => ["SN"],
    "222" => ["MR"],
    "223" => ["ML"],
    "224" => ["GN"],
    "225" => ["CI"],
    "226" => ["BF"],
    "227" => ["NE"],
    "228" => ["TG"],
    "229" => ["BJ"],
    "230" => ["MU"],
    "231" => ["LR"],
    "232" => ["SL"],
    "233" => ["GH"],
    "234" => ["NG"],
    "235" => ["TD"],
    "236" => ["CF"],
    "237" => ["CM"],
    "238" => ["CV"],
    "239" => ["ST"],
    "240" => ["GQ"],
    "241" => ["GA"],
    "242" => ["CG"],
    "243" => ["CD"],
    "244" => ["AO"],
    "245" => ["GW"],
    "246" => ["IO"],
    "247" => ["AC"],
    "248" => ["SC"],
    "249" => ["SD"],
    "250" => ["RW"],
    "251" => ["ET"],
    "252" => ["SO", "QS"],
    "253" => ["DJ"],
    "254" => ["KE"],
    "255" => ["TZ"],
    "256" => ["UG"],
    "257" => ["BI"],
    "258" => ["MZ"],
    "259" => [],
    "260" => ["ZM"],
    "261" => ["MG"],
    "262" => ["RE", "YT"],
    "263" => ["ZW"],
    "264" => ["NA"],
    "265" => ["MW"],
    "266" => ["LS"],
    "267" => ["BW"],
    "268" => ["SZ"],
    "269" => ["KM"],
    "27"  => ["ZA"],
    "28"  => [],
    "290" => ["SH", "TA"],
    "291" => ["ER"],
    "292" => [],
    "293" => [],
    "294" => [],
    "295" => [],
    "296" => [],
    "297" => ["AW"],
    "298" => ["FO"],
    "299" => ["GL"],
    "30"  => ["GR"],
    "31"  => ["NL"],
    "32"  => ["BE"],
    "33"  => ["FR"],
    "34"  => ["ES"],
    "350" => ["GI"],
    "351" => ["PT"],
    "352" => ["LU"],
    "353" => ["IE"],
    "354" => ["IS"],
    "355" => ["AL"],
    "356" => ["MT"],
    "357" => ["CY"],
    "358" => ["FI", "AX"],
    "359" => ["BG"],
    "36"  => ["HU"],
    "370" => ["LT"],
    "371" => ["LV"],
    "372" => ["EE"],
    "373" => ["MD"],
    "374" => ["AM", "QN"],
    "375" => ["BY"],
    "376" => ["AD"],
    "377" => ["MC"],
    "378" => ["SM"],
    "379" => ["VA"],
    "380" => ["UA"],
    "381" => ["RS"],
    "382" => ["ME"],
    "383" => [],
    "384" => [],
    "385" => ["HR"],
    "386" => ["SI"],
    "387" => ["BA"],
    "388" => [],
    "389" => ["MK"],
    "39"  => ["IT", "VA"],
    "40"  => ["RO"],
    "41"  => ["CH"],
    "420" => ["CZ"],
    "421" => ["SK"],
    "422" => [],
    "423" => ["LI"],
    "424" => [],
    "425" => [],
    "426" => [],
    "427" => [],
    "428" => [],
    "429" => [],
    "43"  => ["AT"],
    "44"  => ["GB", "GG", "IM", "JE"],
    "45"  => ["DK"],
    "46"  => ["SE"],
    "47"  => ["NO", "SJ"],
    "48"  => ["PL"],
    "49"  => ["DE"],
    "500" => ["FK"],
    "501" => ["BZ"],
    "502" => ["GT"],
    "503" => ["SV"],
    "504" => ["HN"],
    "505" => ["NI"],
    "506" => ["CR"],
    "507" => ["PA"],
    "508" => ["PM"],
    "509" => ["HT"],
    "51"  => ["PE"],
    "52"  => ["MX"],
    "53"  => ["CU"],
    "54"  => ["AR"],
    "55"  => ["BR"],
    "56"  => ["CL"],
    "57"  => ["CO"],
    "58"  => ["VE"],
    "590" => ["GP"],
    "591" => ["BO"],
    "592" => ["GY"],
    "593" => ["EC"],
    "594" => ["GF"],
    "595" => ["PY"],
    "596" => ["MQ"],
    "597" => ["SR"],
    "598" => ["UY"],
    "599" => ["AN"],
    "60"  => ["MY"],
    "61"  => ["AU", "CX", "CC"],
    "62"  => ["ID"],
    "63"  => ["PH"],
    "64"  => ["NZ"],
    "65"  => ["SG"],
    "66"  => ["TH"],
    "670" => ["TL"],
    "671" => [],
    "672" => ["NF", "AQ"],
    "673" => ["BN"],
    "674" => ["NR"],
    "675" => ["PG"],
    "676" => ["TO"],
    "677" => ["SB"],
    "678" => ["VU"],
    "679" => ["FJ"],
    "680" => ["PW"],
    "681" => ["WF"],
    "682" => ["CK"],
    "683" => ["NU"],
    "684" => [],
    "685" => ["WS"],
    "686" => ["KI"],
    "687" => ["NC"],
    "688" => ["TV"],
    "689" => ["PF"],
    "690" => ["TK"],
    "691" => ["FM"],
    "692" => ["MH"],
    "693" => [],
    "694" => [],
    "695" => [],
    "696" => [],
    "697" => [],
    "698" => [],
    "699" => [],
    "7"   => ["RU", "KZ"],
    "800" => ["XT"],
    "801" => [],
    "802" => [],
    "803" => [],
    "804" => [],
    "805" => [],
    "806" => [],
    "807" => [],
    "808" => ["XS"],
    "809" => [],
    "81"  => ["JP"],
    "82"  => ["KR"],
    "83"  => [],
    "84"  => ["VN"],
    "850" => ["KP"],
    "851" => [],
    "852" => ["HK"],
    "853" => ["MO"],
    "854" => [],
    "855" => ["KH"],
    "856" => ["LA"],
    "857" => [],
    "858" => [],
    "859" => [],
    "86"  => ["CN"],
    "870" => ["XN"],
    "871" => ["XE"],
    "872" => ["XF", "PN"],
    "873" => ["XI"],
    "874" => ["XW"],
    "875" => [],
    "876" => [],
    "877" => [],
    "878" => ["XP"],
    "879" => [],
    "880" => ["BD"],
    "881" => ["XG"],
    "882" => ["XV"],
    "883" => ["XL"],
    "884" => [],
    "885" => [],
    "886" => ["TW"],
    "887" => [],
    "888" => ["XD"],
    "889" => [],
    "89"  => [],
    "90"  => ["TR", "QY"],
    "91"  => ["IN"],
    "92"  => ["PK"],
    "93"  => ["AF"],
    "94"  => ["LK"],
    "95"  => ["MM"],
    "960" => ["MV"],
    "961" => ["LB"],
    "962" => ["JO"],
    "963" => ["SY"],
    "964" => ["IQ"],
    "965" => ["KW"],
    "966" => ["SA"],
    "967" => ["YE"],
    "968" => ["OM"],
    "969" => [],
    "970" => ["PS"],
    "971" => ["AE"],
    "972" => ["IL", "PS"],
    "973" => ["BH"],
    "974" => ["QA"],
    "975" => ["BT"],
    "976" => ["MN"],
    "977" => ["NP"],
    "978" => [],
    "979" => ["XR"],
    "98"  => ["IR"],
    "990" => [],
    "991" => ["XC"],
    "992" => ["TJ"],
    "993" => ["TM"],
    "994" => ["AZ", "QN"],
    "995" => ["GE"],
    "996" => ["KG"],
    "997" => [],
    "998" => ["UZ"],
    "999" => []
  }.freeze
end
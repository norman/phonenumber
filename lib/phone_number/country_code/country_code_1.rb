# Rules and functionality for country code "1", the North American Numbering
# Plan countries. This includes the USA, Canada and the Caribbean.
class CountryCode::CountryCode1 < CountryCode::Base

  class << self
    
    def international_prefix
      "011"
    end
    
    def default_format
      "(%a) %p-%l"
    end
    
    def real_number(phone_number)
      phone_number.number.to_s.gsub(/^1/, '')
    end

    def area_code(phone_number)
      phone_number.real_number.slice(0..2).to_s
    end

    def prefix(phone_number)
      phone_number.real_number.slice(3..5).to_s
    end

    def line_number(phone_number)
      phone_number.real_number.slice(6..9).to_s
    end

    def region(phone_number)
      AREA_CODES[self.area_code(phone_number)][0]
    end

    def country(phone_number)
      AREA_CODES[self.area_code(phone_number)][1]
    end
    
    def city(phone_number)
      (AREA_CODES[self.area_code(phone_number)][2] || []).first
    end

    def cities(phone_number)
      AREA_CODES[self.area_code(phone_number)][2] || []
    end

  end

  AREA_CODES = {
    # area code => ["state/province", "country", "cities"]
    "201" => ["NJ", "US", ["Jersey City"]],
    "202" => ["DC", "US", ["Washington"]],
    "203" => ["CT", "US", ["Waterbury", "New Haven", "Bridgeport", "Stamford"]],
    "204" => ["MB", "CA"],
    "205" => ["AL", "US", ["Montgomery", "Selma", "Jackson"]],
    "206" => ["WA", "US", ["Seattle"]],
    "207" => ["ME", "US"],
    "208" => ["ID", "US"],
    "209" => ["CA", "US", ["Stockton", "Merced"]],
    "210" => ["TX", "US", ["San Antonio"]],
    "212" => ["NY", "US", ["New York"]],
    "213" => ["CA", "US", ["Los Angeles"]],
    "214" => ["TX", "US", ["Dallas"]],
    "215" => ["PA", "US", ["Philadelphia"]],
    "216" => ["OH", "US", ["Cleveland"]],
    "217" => ["IL", "US", ["Springfield", "Decatur", "Champaign"]],
    "218" => ["MN", "US", ["Duluth", "Brainerd", "Grand Rapids", "International Falls"]],
    "219" => ["IN", "US", ["Fort Wayne", "South Bend", "Gary"]],
    "224" => ["IL", "US", ["Chicago"]],
    "225" => ["LA", "US", ["Baton Rouge", "New Roads"]],
    "226" => ["ON", "CA", ["London", "Guelph"]],
    "228" => ["MS", "US", ["Gulfport", "Pascagoula"]],
    "229" => ["GA", "US", ["Albany", "Americus", "Bainbridge", "Valdosta"]],
    "231" => ["MI", "US", ["Traverse City", "Muskegon", "Ludington"]],
    "234" => ["OH", "US", ["Akron", "Canton", "Youngstown"]],
    "239" => ["FL", "US", ["Fort Meyers"]],
    "240" => ["MD", "US", ["Frederick", "Hagerstown", "Cumberland"]],
    "242" => ["", "BS"],
    "246" => ["", "BB"],
    "248" => ["MI", "US", ["Troy"]],
    "250" => ["BC", "CA", ["Vancouver Island and interior BC"]],
    "251" => ["AL", "US", ["Mobile"]],
    "252" => ["NC", "US", ["Greenville", "Kitty Hawk"]],
    "253" => ["WA", "US", ["Tacoma"]],
    "254" => ["TX", "US", ["Waco", "Killeen"]],
    "256" => ["AL", "US", ["Huntsville"]],
    "260" => ["IN", "US", ["Fort Wayne"]],
    "262" => ["WI", "US", ["Racine", "West Bend"]],
    "264" => ["", "AI"],
    "267" => ["PA", "US", ["Philadelphia"]],
    "268" => ["", "AG"],
    "269" => ["MI", "US", ["Battle Creek", "Kalamazoo", "Allegan"]],
    "270" => ["KY", "US", ["Paducah", "Bowling Green", "Owensboro"]],
    "276" => ["VA", "US", ["Bristol", "Galax", "Martinsville", "Norton"]],
    "281" => ["TX", "US", ["Houston"]],
    "284" => ["", "VG"],
    "289" => ["ON", "CA", ["Hamilton", "Oshawa"]],
    "301" => ["MD", "US", ["Frederick", "Hagerstown", "Cumberland"]],
    "302" => ["DE", "US"],
    "303" => ["CO", "US", ["Denver", "Boulder"]],
    "304" => ["WV", "US"],
    "305" => ["FL", "US", ["Miami", "Key West"]],
    "306" => ["SK", "CA"],
    "307" => ["WY", "US"],
    "308" => ["NE", "US", ["Scottsbluff", "North Platte"]],
    "309" => ["IL", "US", ["Moline", "Peoria"]],
    "310" => ["CA", "US", ["West Los Angeles", "Torrance", "Malibu"]],
    "312" => ["IL", "US", ["Chicago"]],
    "313" => ["MI", "US", ["Detroit"]],
    "314" => ["MO", "US", ["Saint Louis"]],
    "315" => ["NY", "US", ["Syracuse", "Utica", "Watertown"]],
    "316" => ["KS", "US", ["Wichita", "Parsons", "Great Bend"]],
    "317" => ["IN", "US", ["Indianapolis"]],
    "318" => ["LA", "US", ["Shreveport", "Monroe", "Alexandria"]],
    "319" => ["IA", "US", ["Dubuque", "Davenport", "Iowa City", "Burlington"]],
    "320" => ["MN", "US", ["Saint Cloud", "Morris", "Hutchinson"]],
    "321" => ["FL", "US", ["Orlando"]],
    "323" => ["CA", "US", ["Los Angeles"]],
    "325" => ["TX", "US", ["Abilene", "San Angelo"]],
    "330" => ["OH", "US", ["Akron", "Canton", "Youngstown"]],
    "331" => ["IL", "US", ["Aurora", "Bolingbrook", "Naperville", "Wheaton"]],
    "334" => ["AL", "US", ["Birmingham", "Tuscaloosa"]],
    "336" => ["NC", "US", ["Winston Salem"]],
    "337" => ["LA", "US", ["Lafayette", "Lake Charles"]],
    "339" => ["MA", "US", ["Lynn", "Malden", "Medford", "Waltham", "Weymouth"]],
    "340" => ["VI", "US"],
    "345" => ["", "KY"],
    "347" => ["NY", "US", ["Bronx", "Queens", "Brooklyn", "Staten Island"]],
    "351" => ["MA", "US", ["Haverhill", "Lawrence", "Lowell"]],
    "352" => ["FL", "US", ["Gainesville", "Ocala"]],
    "360" => ["WA", "US", ["Olympia", "Bellingham", "Aberdeen"]],
    "361" => ["TX", "US", ["Corpus Christi", "Victoria"]],
    "386" => ["FL", "US", ["Daytona Beach", "Deltona"]],
    "401" => ["RI", "US"],
    "402" => ["NE", "US", ["Omaha", "Lincoln"]],
    "403" => ["AB", "CA", ["Calgary", "southern portion"]],
    "404" => ["GA", "US", ["Atlanta"]],
    "405" => ["OK", "US", ["Oklahoma City", "Edmond"]],
    "406" => ["MT", "US"],
    "407" => ["FL", "US", ["Orlando"]],
    "408" => ["CA", "US", ["San Jose", "Sunnyvale", "Los Gatos"]],
    "409" => ["TX", "US", ["Beaumont", "Galveston"]],
    "410" => ["MD", "US", ["Baltimore", "Cambridge"]],
    "412" => ["PA", "US", ["Pittsburgh"]],
    "413" => ["MA", "US", ["Springfield", "Pittsfield"]],
    "414" => ["WI", "US", ["Milwaukee"]],
    "415" => ["CA", "US", ["San Francisco", "Novato", "San Rafael"]],
    "416" => ["ON", "CA", ["Toronto"]],
    "417" => ["MO", "US", ["Springfield", "Joplin"]],
    "418" => ["QC", "CA", ["Quebec"]],
    "419" => ["OH", "US", ["Toledo", "Sandusky", "Bowling Green"]],
    "423" => ["TN", "US", ["Chattanooga", "Sweetwater", "Bristol"]],
    "424" => ["CA", "US", ["Carson", "Compton", "Redondo Beach"]],
    "425" => ["WA", "US", ["Bellevue", "Renton", "Everett", "Kirkland"]],
    "430" => ["TX", "US", ["Longview", "Tyler"]],
    "432" => ["TX", "US", ["Midland", "Odessa"]],
    "434" => ["VA", "US", ["Lynchburg"]],
    "435" => ["UT", "US", ["Logan", "Blanding", "Richfield"]],
    "438" => ["QC", "CA", ["Montreal"]],
    "440" => ["OH", "US", ["Ashtabula", "Elyria"]],
    "441" => ["", "BM"],
    "443" => ["MD", "US", ["Baltimore", "Cambridge"]],
    "450" => ["QC", "CA", ["Laval"]],
    "456" => ["", "", "NANP area", ["Inbound International"]],
    "469" => ["TX", "US", ["Dallas", "Plano"]],
    "473" => ["", "GD"],
    "478" => ["GA", "US", ["Macon", "Warner Robins", "Swainsboro"]],
    "479" => ["AR", "US", ["Fayetteville", "Fort Smith"]],
    "480" => ["AZ", "US", ["eastern Phoenix area", "Chandler"]],
    "484" => ["PA", "US", ["Allentown", "Reading"]],
    "500" => ["", "", "NANP area", ["Personal Communication Service"]],
    "501" => ["AR", "US", ["Little Rock", "Fayetteville", "Hot Springs"]],
    "502" => ["KY", "US", ["Louisville", "Frankfort"]],
    "503" => ["OR", "US", ["Portland", "Salem", "Tillamoon", "Astoria"]],
    "504" => ["LA", "US", ["New Orleans", "Houma"]],
    "505" => ["NM", "US", ["Albuquerque", "Santa Fe"]],
    "506" => ["NB", "CA"],
    "507" => ["MN", "US", ["Rochester", "Mankato", "Marshall", "Worthington"]],
    "508" => ["MA", "US", ["Worcester", "Attleboro", "New Bedford", "Hyannis"]],
    "509" => ["WA", "US", ["Spokane", "Yakima", "Walla Walla"]],
    "510" => ["CA", "US", ["Oakland", "Hayward"]],
    "512" => ["TX", "US", ["Austin"]],
    "513" => ["OH", "US", ["Cincinnati", "Middletown"]],
    "514" => ["QC", "CA", ["Montreal"]],
    "515" => ["IA", "US", ["Des Moines", "Fort Dodge"]],
    "516" => ["NY", "US", ["Elmont"]],
    "517" => ["MI", "US", ["Lansing", "Jackson", "Alpena"]],
    "518" => ["NY", "US", ["Albany", "Saranac Lake", "Plattsburgh"]],
    "519" => ["ON", "CA", ["Windsor", "London"]],
    "520" => ["AZ", "US", ["non-Phoenix areas"]],
    "530" => ["CA", "US", ["Redding", "Chico", "Alturas"]],
    "540" => ["VA", "US", ["Roanoke", "Harrisonburg", "Fredricksburg", "Winchester"]],
    "541" => ["OR", "US", ["Eugene", "Bend", "Medford", "Burns"]],
    "551" => ["NJ", "US", ["Jersey City", "Bayonne", "Union City"]],
    "559" => ["CA", "US", ["Fresno"]],
    "561" => ["FL", "US", ["West Palm Beach", "Boca Raton"]],
    "562" => ["CA", "US", ["Long Beach"]],
    "563" => ["IA", "US", ["Davenport", "Dubuque"]],
    "567" => ["OH", "US", ["Toledo"]],
    "570" => ["PA", "US", ["Scranton", "Williamsport"]],
    "571" => ["VA", "US", ["Alexandria"]],
    "573" => ["MO", "US", ["Jefferson City", "Hannibal"]],
    "574" => ["IN", "US", ["Elkhart", "South Bend"]],
    "575" => ["NM", "US", ["Las Cruces", "Rio Rancho"]],
    "580" => ["OK", "US", ["Enid", "Woodward", "Lawton"]],
    "581" => ["QC", "CA", ["Quebec City", "Levis"]],
    "585" => ["NY", "US", ["Rochester"]],
    "586" => ["MI", "US", ["St. Clair Shores", "Sterling Heights", "Warren"]],
    "587" => ["AB", "CA", ["Edmonton", "Calgary", "Lethbridge", "Medicine Hat", "Red Deer"]],
    "600" => ["", "CA", ["Canadian Services"]],
    "601" => ["MS", "US", ["Jackson", "Mc Comb"]],
    "602" => ["AZ", "US", ["Phoenix"]],
    "603" => ["NH", "US"],
    "604" => ["BC", "CA", ["Vancouver"]],
    "605" => ["SD", "US"],
    "606" => ["KY", "US", ["London", "Morehead", "Pikeville"]],
    "607" => ["NY", "US", ["Elmira", "Binghamton"]],
    "608" => ["WI", "US", ["Madison", "La Crosse"]],
    "609" => ["NJ", "US", ["Trenton", "Atlantic City", "Brown Mills"]],
    "610" => ["PA", "US", ["Allentown", "Reading"]],
    "612" => ["MN", "US", ["Minneapolis"]],
    "613" => ["ON", "CA", ["Ottawa"]],
    "614" => ["OH", "US", ["Columbus"]],
    "615" => ["TN", "US", ["Nashville"]],
    "616" => ["MI", "US", ["Kalamazoo", "Grand Rapids"]],
    "617" => ["MA", "US", ["Boston"]],
    "618" => ["IL", "US", ["Mount Vernon", "Carbondale"]],
    "619" => ["CA", "US", ["San Diego"]],
    "620" => ["KS", "US", ["Dodge City"]],
    "623" => ["AZ", "US", ["western Phoenix area", "Peoria", "Buckeye"]],
    "626" => ["CA", "US", ["Pasadena"]],
    "630" => ["IL", "US", ["Aurora"]],
    "631" => ["NY", "US", ["Eastern Long Island"]],
    "636" => ["MO", "US", ["Union", "Chesterfield"]],
    "641" => ["IA", "US", ["Mason City", "Creston"]],
    "646" => ["NY", "US", ["New York"]],
    "647" => ["ON", "CA", ["Toronto"]],
    "649" => ["", "TC"],
    "650" => ["CA", "US", ["Palo Alto", "San Mateo"]],
    "651" => ["MN", "US", ["Saint Paul", "Lindstrom", "Red Wing"]],
    "657" => ["CA", "US", ["Anaheim"]],
    "660" => ["MO", "US", ["Macon", "Marshall", "Sedalia"]],
    "661" => ["CA", "US", ["Bakersfield"]],
    "662" => ["MS", "US", ["Tupelo", "Columbus", "Greenville"]],
    "664" => ["", "MS"],
    "670" => ["", "MP"],
    "671" => ["GU", "US"],
    "678" => ["GA", "US", ["Atlanta"]],
    "682" => ["TX", "US", ["Fort Worth"]],
    "684" => ["AS", "US"],
    "700" => ["", "", "NANP area", ["Interexchange Carrier Services"]],
    "701" => ["ND", "US"],
    "702" => ["NV", "US", ["Las Vegas"]],
    "703" => ["VA", "US", ["Alexandria"]],
    "704" => ["NC", "US", ["Charlotte", "Kingstown"]],
    "705" => ["ON", "CA", ["Sudbury", "Sault Ste Marie"]],
    "706" => ["GA", "US", ["Athens", "Augusta", "Toccoa", "Dalton", "Rome"]],
    "707" => ["CA", "US", ["Santa Rosa", "Ukiah", "Eureka"]],
    "708" => ["IL", "US", ["Chicago Heights"]],
    "709" => ["NL", "CA"],
    "710" => ["US", "US", ["US Government"]],
    "712" => ["IA", "US", ["Sioux City", "Council Bluffs"]],
    "713" => ["TX", "US", ["Houston"]],
    "714" => ["CA", "US", ["Orange", "Huntington Beach"]],
    "715" => ["WI", "US", ["Wausau", "Eau Claire"]],
    "716" => ["NY", "US", ["Buffalo", "Rochester", "Jamestown"]],
    "717" => ["PA", "US", ["Harrisburg", "Gettysburg"]],
    "718" => ["NY", "US", ["Bronx", "Queens", "Brooklyn", "Staten Island"]],
    "719" => ["CO", "US", ["Colorado Springs", "Pueblo"]],
    "720" => ["CO", "US", ["Denver", "Boulder"]],
    "724" => ["PA", "US", ["New Castle", "Uniontown"]],
    "727" => ["FL", "US", ["Clearwater"]],
    "731" => ["TN", "US", ["Jackson"]],
    "732" => ["NJ", "US", ["Lakewood", "New Brunswick", "Neptune"]],
    "734" => ["MI", "US", ["Ann Arbor"]],
    "740" => ["OH", "US", ["Cambridge", "Jackson", "Lancaster", "Marietta"]],
    "754" => ["FL", "US", ["Fort Lauderdale"]],
    "757" => ["VA", "US", ["Norfolk"]],
    "758" => ["", "LC"],
    "760" => ["CA", "US", ["Indio", "Ridgecrest", "Bishop", "Blythe"]],
    "762" => ["GA", "US", ["Athens", "Augusta", "Columbus"]],
    "763" => ["MN", "US", ["Maple Grove"]],
    "765" => ["IN", "US", ["Lafayette", "Marion", "Muncie", "Richmond"]],
    "767" => ["", "DM"],
    "769" => ["MS", "US"],
    "770" => ["GA", "US", ["Roswell", "Marietta", "Cedartown", "Griffin"]],
    "772" => ["FL", "US", ["Port St. Lucie"]],
    "773" => ["IL", "US", ["Chicago"]],
    "774" => ["MA", "US", ["Worcester", "Framingham", "Brockton"]],
    "775" => ["NV", "US", ["Reno", "Carson City", "Elko", "Ely", "Tonopah"]],
    "778" => ["BC", "CA", "Vancouver", "Victoria", "Surrey"],
    "779" => ["IL", "US", ["Joliet", "Rockford"]],
    "780" => ["AB", "CA", ["Edmonton", "northern portion"]],
    "781" => ["MA", "US", ["Norwood", "Weymouth", "Saugus"]],
    "784" => ["", "VC"],
    "785" => ["KS", "US", ["Topeka", "Saline"]],
    "786" => ["FL", "US", ["Miami"]],
    "787" => ["PR", "PR", ["Bayamón", "Caguas", "Carolina", "San Juan", "Ponce"]],
    "800" => ["", "", "NANP area", ["Toll-Free"]],
    "801" => ["UT", "US", ["Salt Lake City"]],
    "802" => ["VT", "US"],
    "803" => ["SC", "US", ["Columbia", "Sumter"]],
    "804" => ["VA", "US", ["Richmond", "Lynchburg", "Danville"]],
    "805" => ["CA", "US", ["Thousand Oaks", "San Luis Obispo", "Lompoc"]],
    "806" => ["TX", "US", ["Amarillo", "Lubbock"]],
    "807" => ["ON", "CA", ["Thunder Bay"]],
    "808" => ["HI", "US"],
    "809" => ["", "DO"],
    "810" => ["MI", "US", ["Flint", "Port Huron"]],
    "812" => ["IN", "US", ["Terre Haute", "Bloomington", "New Albany", "Evansville"]],
    "813" => ["FL", "US", ["Tampa"]],
    "814" => ["PA", "US", ["Erie", "Warren", "Altoona", "Johnstown"]],
    "815" => ["IL", "US", ["Rickford", "Freeport", "De Kalb", "La Salle"]],
    "816" => ["MO", "US", ["Kansas City", "Saint Joseph"]],
    "817" => ["TX", "US", ["Fort Worth"]],
    "818" => ["CA", "US", ["Glendale", "San Fernando"]],
    "819" => ["QC", "CA", ["Hull", "Sherbrooke"]],
    "828" => ["NC", "US", ["Asheville"]],
    "829" => ["", "D0"],
    "830" => ["TX", "US", ["Uvalde"]],
    "831" => ["CA", "US", ["Salinas", "Santa Cruz"]],
    "832" => ["TX", "US", ["Houston"]],
    "843" => ["SC", "US", ["Charleston", "Myrtle Beach", "Florence"]],
    "845" => ["NY", "US", ["Poughkeepsie", "Middletown"]],
    "847" => ["IL", "US", ["Waukegan", "Des Plaines"]],
    "848" => ["NJ", "US"],
    "850" => ["FL", "US", ["Tallahassee"]],
    "856" => ["NJ", "US", ["Cherry Hill", "Vineland"]],
    "857" => ["MA", "US"],
    "858" => ["CA", "US", ["Solano Beach", "northern San Diego area"]],
    "859" => ["KY", "US", ["Lexington"]],
    "860" => ["CT", "US", ["Hartford", "Norwich"]],
    "862" => ["NJ", "US"],
    "863" => ["FL", "US", ["Avon Park", "Clewiston"]],
    "864" => ["SC", "US", ["Greenville", "Spartanburg", "Anderson"]],
    "865" => ["TN", "US", ["Knoxville"]],
    "866" => ["", "", "NANP area", ["Toll-Free"]],
    "867" => [["NT", "TY", "NU"], "CA"],
    "868" => ["", "TT"],
    "869" => ["", "KN"],
    "870" => ["AR", "US", ["Jonesboro", "Pine Bluff"]],
    "876" => ["", "JM"],
    "877" => ["", "", "NANP area", ["Toll-Free"]],
    "878" => ["PA", "US", ["Pittsburgh"]],
    "888" => ["", "", "NANP area", ["Toll-Free"]],
    "900" => ["", "", "NANP area", ["Premium Services"]],
    "901" => ["TN", "US", ["Memphis", "Jackson", "Union City"]],
    "902" => ["NS", "CA"],
    "903" => ["TX", "US", ["Tyler", "Sherman"]],
    "904" => ["FL", "US", ["Jacksonville"]],
    "905" => ["NS", "CA", ["Hamilton area"]],
    "906" => ["MI", "US", ["Sault Ste. Marie", "Escanaba", "Marquette"]],
    "907" => ["AK", "US"],
    "908" => ["NJ", "US", ["Washington"]],
    "909" => ["CA", "US", ["Pomona", "San Bernadino", "Temecula"]],
    "910" => ["NC", "US", ["Fayetteville", "Wilmington", "Jacksonville"]],
    "912" => ["GA", "US", ["Waycross", "Brunswick", "Savannah", "Vidalia"]],
    "913" => ["KS", "US", ["Kansas City", "Overland Park"]],
    "914" => ["NY", "US", ["White Plains"]],
    "915" => ["TX", "US", ["El Paso", "Alpine", "Midland", "Abilene"]],
    "916" => ["CA", "US", ["Sacramento"]],
    "917" => ["NY", "US", ["New York", "Bronx", "Queens", "Brooklyn", "Staten Island"]],
    "918" => ["OK", "US", ["Tulsa", "Mcalester", "Bartlesville"]],
    "919" => ["NC", "US", ["Raleigh", "Durham"]],
    "920" => ["WI", "US", ["Green Bay", "Oshkosh", "Sheboygan"]],
    "925" => ["CA", "US", ["Concord", "Pleasanton"]],
    "928" => ["AZ", "US", "Flagstaff", "Yuma"],
    "931" => ["TN", "US", ["Columbia", "Manchester", "Clarksville", "Cookeville"]],
    "936" => ["TX", "US", ["Huntsville", "Lufkin"]],
    "937" => ["OH", "US", ["Dayton", "Springfield", "Hillsboro"]],
    "939" => ["PR", "PR", ["San Juan", "Caguas", "Bayamón", "Carolina"]],
    "940" => ["TX", "US", ["Vernon", "Wichita Falls"]],
    "941" => ["FL", "US", ["Naples", "Fort Meyers"]],
    "947" => ["MI", "US", ["Pontiac"]],
    "949" => ["CA", "US", ["Irvine", "Laguna Niguel"]],
    "951" => ["CA", "US", ["Riverside", "Temecula"]],
    "952" => ["MN", "US", ["Bloomington"]],
    "954" => ["FL", "US", ["Fort Lauderdale"]],
    "956" => ["TX", "US", ["Mcallen", "Brownsville"]],
    "970" => ["CO", "US", ["Grand Junction", "Steamboat Springs", "Fort Collins"]],
    "971" => ["OR", "US", ["Portland", "Salem"]],
    "972" => ["TX", "US", ["Dallas", "Plano"]],
    "973" => ["NJ", "US", ["Paterson", "Sussex"]],
    "978" => ["MA", "US", ["Peabody", "Fitchburg"]],
    "979" => ["TX", "US", ["Wharton"]],
    "980" => ["NC", "US", ["Charlotte", "Concord", "Gastonia"]],
    "985" => ["LA", "US", "Houma", "Slidell"],
    "989" => ["MI", "US", ["Saginaw"]],
  }

end
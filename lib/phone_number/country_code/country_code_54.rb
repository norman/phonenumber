# Rules and functionality for country code "54", Argentina.
# Database taken from http://www.cnc.gov.ar/numeracion/IndicativosInterurbanos.asp.
# For more information about Argentina phone numbers, see {this Wikipedia article}[http://en.wikipedia.org/wiki/Telephone_numbers_in_Argentina].
class CountryCode::CountryCode54 < CountryCode::Base

  class << self

    def international_prefix
      "00"
    end
    
    def default_format
      "0%a %o %p %l"
    end

    def real_number(phone_number)
      num = phone_number.number.to_s.gsub(/\A0|\A54/, '')
      num =~ /^4[\d]{7}/ ? "11#{num}" : num
    end

    def area_code(phone_number)
      # Strip international local prefix for cell phones
      ln = phone_number.real_number.gsub(/\A9/, '')
      [4,3,2].each {|i| return ln.slice(0, i) if AREA_CODES[ln.slice(0, i)] }
      return ""
    end

    def local_prefix(phone_number)
      if phone_number.real_number =~ /\A9/
        return "9"
      elsif phone_number.real_number.slice(phone_number.area_code.length, 2) == "15"
        "15"
      end
    end

    def prefix(phone_number)
      ln = phone_number.real_number_without_local_prefix
      if phone_number.area_code.length == 4
        ln.slice(3, 3)
      elsif phone_number.area_code.length == 3
        ln.slice(3, 3)
      else
        ln.slice(2, 4)
      end
    end

    def line_number(phone_number)
      ln = phone_number.real_number_without_local_prefix
      ln.slice(phone_number.area_code.length + phone_number.prefix.length, ln.length)
    end

    def region(phone_number)
      AREA_CODES[phone_number.area_code][:region]
    end

    def city(phone_number)
      AREA_CODES[phone_number.area_code][:city]
    end

    def country(phone_number)
      'AR'
    end

    def real_number_without_local_prefix(phone_number)
      if !phone_number.local_prefix
        phone_number.real_number
      elsif phone_number.local_prefix == "9"
        phone_number.real_number.slice(1, phone_number.real_number.length)
      elsif phone_number.local_prefix == "15"
        phone_number.real_number.gsub(/\A#{phone_number.area_code}15/, phone_number.area_code)
      end
    end

  end

  AREA_CODES = {
    "11"     => {:city => "Buenos Aires", :region => "C"},
    "220"    => {:city => "Merlo", :region => "B"},
    "2202"   => {:city => "González Catán", :region => "B"},
    "221"    => {:city => "La Plata", :region => "B"},
    "2221"   => {:city => "Magdalena", :region => "B"},
    "2223"   => {:city => "Coronel Brandsen", :region => "B"},
    "2224"   => {:city => "Glew", :region => "B"},
    "2225"   => {:city => "Alejandro Korn", :region => "B"},
    "2226"   => {:city => "Cañuelas", :region => "B"},
    "2227"   => {:city => "Lobos", :region => "B"},
    "2229"   => {:city => "Juan María Gutiérrez", :region => "B"},
    "223"    => {:city => "Mar del Plata", :region => "B"},
    "2241"   => {:city => "Chascomus", :region => "B"},
    "2242"   => {:city => "Lezama", :region => "B"},
    "2243"   => {:city => "General Belgrano", :region => "B"},
    "2244"   => {:city => "Las Flores", :region => "B"},
    "2245"   => {:city => "Dolores", :region => "B"},
    "2246"   => {:city => "Santa Teresita", :region => "B"},
    "2252"   => {:city => "San Clemente del Tuyú", :region => "B"},
    "2254"   => {:city => "Pinamar", :region => "B"},
    "2255"   => {:city => "Villa Gesell", :region => "B"},
    "2257"   => {:city => "Mar de Ajó", :region => "B"},
    "2261"   => {:city => "Lobería", :region => "B"},
    "2262"   => {:city => "Necochea", :region => "B"},
    "2264"   => {:city => "La Dulce", :region => "B"},
    "2265"   => {:city => "Coronel Vidal", :region => "B"},
    "2266"   => {:city => "Balcarce", :region => "B"},
    "2267"   => {:city => "General Madariaga", :region => "B"},
    "2268"   => {:city => "Maipú", :region => "B"},
    "2271"   => {:city => "Monte", :region => "B"},
    "2272"   => {:city => "Navarro", :region => "B"},
    "2273"   => {:city => "Carmen de Areco", :region => "B"},
    "2274"   => {:city => "Carlos Spegazzini", :region => "B"},
    "2281"   => {:city => "Azul", :region => "B"},
    "2283"   => {:city => "Tapalqué", :region => "B"},
    "2284"   => {:city => "Olavarría", :region => "B"},
    "2285"   => {:city => "Laprida", :region => "B"},
    "2286"   => {:city => "General Lamadrid", :region => "B"},
    "2291"   => {:city => "Miramar", :region => "B"},
    "2292"   => {:city => "Benito Juárez", :region => "B"},
    "2293"   => {:city => "Tandil", :region => "B"},
    "2296"   => {:city => "Ayacucho", :region => "B"},
    "2297"   => {:city => "Rauch", :region => "B"},
    "2302"   => {:city => "General Pico", :region => "L"},
    "2314"   => {:city => "Bolivar", :region => "B"},
    "2316"   => {:city => "Daireaux", :region => "B"},
    "2317"   => {:city => "9 de Julio", :region => "B"},
    "2320"   => {:city => "Jose C. Paz", :region => "B"},
    "2322"   => {:city => "Pilar", :region => "B"},
    "2323"   => {:city => "Luján", :region => "B"},
    "2324"   => {:city => "Mercedes", :region => "B"},
    "2325"   => {:city => "San Andrés de Giles", :region => "B"},
    "2326"   => {:city => "San Antonio de Areco", :region => "B"},
    "2331"   => {:city => "Realicó", :region => "L"},
    "2333"   => {:city => "Quemú Quemú", :region => "L"},
    "2334"   => {:city => "Eduardo Castex", :region => "L"},
    "2335"   => {:city => "Caleufu", :region => "L"},
    "2336"   => {:city => "Huinca Renanco", :region => "X"},
    "2337"   => {:city => "America", :region => "B"},
    "2338"   => {:city => "Victorica", :region => "L"},
    "2342"   => {:city => "Bragado", :region => "B"},
    "2343"   => {:city => "Norberto de La Riestra", :region => "B"},
    "2344"   => {:city => "Saladillo", :region => "B"},
    "2345"   => {:city => "25 de Mayo", :region => "B"},
    "2346"   => {:city => "Chivilcoy", :region => "B"},
    "2352"   => {:city => "Chacabuco", :region => "B"},
    "2353"   => {:city => "General Arenales", :region => "B"},
    "2354"   => {:city => "Vedia", :region => "B"},
    "2355"   => {:city => "Lincoln", :region => "B"},
    "2356"   => {:city => "General Pinto", :region => "B"},
    "2357"   => {:city => "Carlos Tejedor", :region => "B"},
    "2358"   => {:city => "Los Toldos", :region => "B"},
    "2362"   => {:city => "Junín", :region => "B"},
    "237"    => {:city => "Moreno", :region => "B"},
    "2392"   => {:city => "Trenque Lauquen", :region => "B"},
    "2393"   => {:city => "Salazar", :region => "B"},
    "2394"   => {:city => "Tres Lomas", :region => "B"},
    "2395"   => {:city => "Carlos Casares", :region => "B"},
    "2396"   => {:city => "Pehuajó", :region => "B"},
    "2473"   => {:city => "Colón", :region => "B"},
    "2474"   => {:city => "Salto", :region => "B"},
    "2475"   => {:city => "Rojas", :region => "B"},
    "2477"   => {:city => "Pergamino", :region => "B"},
    "2478"   => {:city => "Arrecifes", :region => "B"},
    "261"    => {:city => "Mendoza", :region => "M"},
    "2622"   => {:city => "Tunuyán", :region => "M"},
    "2623"   => {:city => "San Martín", :region => "M"},
    "2624"   => {:city => "Uspallata", :region => "M"},
    "2625"   => {:city => "General Alvear", :region => "M"},
    "2626"   => {:city => "La Paz", :region => "M"},
    "2627"   => {:city => "San Rafael", :region => "M"},
    "264"    => {:city => "San Juán", :region => "J"},
    "2646"   => {:city => "San Agustín del Valle Fertil", :region => "J"},
    "2647"   => {:city => "Jachal", :region => "J"},
    "2648"   => {:city => "Calingasta", :region => "J"},
    "2651"   => {:city => "San Francisco del Monte de Oro", :region => "D"},
    "2652"   => {:city => "San Luis", :region => "D"},
    "2655"   => {:city => "La Toma", :region => "D"},
    "2656"   => {:city => "Tilisarao", :region => "D"},
    "2657"   => {:city => "Mercedes", :region => "D"},
    "2658"   => {:city => "Buena Esperanza", :region => "D"},
    "2901"   => {:city => "Ushuaia", :region => "V"},
    "2902"   => {:city => "Río Turbio", :region => "Z"},
    "2903"   => {:city => "Río Mayo", :region => "U"},
    "291"    => {:city => "Bahía Blanca", :region => "B"},
    "2920"   => {:city => "Viedma", :region => "R"},
    "2921"   => {:city => "Coronel Dorrego", :region => "B"},
    "2922"   => {:city => "Coronel Pringles", :region => "B"},
    "2923"   => {:city => "Pigüe", :region => "B"},
    "2924"   => {:city => "Darregueira", :region => "B"},
    "2925"   => {:city => "Villa Iris", :region => "B"},
    "2926"   => {:city => "Coronel Suárez", :region => "B"},
    "2927"   => {:city => "Médanos", :region => "B"},
    "2928"   => {:city => "Pedro Luro", :region => "B"},
    "2929"   => {:city => "Guamini", :region => "B"},
    "2931"   => {:city => "Río Colorado", :region => "R"},
    "2932"   => {:city => "Punta Alta", :region => "B"},
    "2933"   => {:city => "Huanguelen Sur", :region => "B"},
    "2934"   => {:city => "San Antonio Oeste", :region => "R"},
    "2935"   => {:city => "Rivera", :region => "B"},
    "2936"   => {:city => "Carhue", :region => "B"},
    "2940"   => {:city => "Ingeniero Jacobacci", :region => "R"},
    "2941"   => {:city => "General Roca", :region => "R"},
    "2942"   => {:city => "Zapala", :region => "Q"},
    "2944"   => {:city => "San Carlos de Bariloche", :region => "R"},
    "2945"   => {:city => "Esquel", :region => "U"},
    "2946"   => {:city => "Choele Choel", :region => "R"},
    "2948"   => {:city => "Chos Malal", :region => "Q"},
    "2952"   => {:city => "General Acha", :region => "L"},
    "2953"   => {:city => "Macachín", :region => "L"},
    "2954"   => {:city => "Santa Rosa", :region => "L"},
    "2962"   => {:city => "San Julián", :region => "Z"},
    "2963"   => {:city => "Perito Moreno", :region => "Z"},
    "2964"   => {:city => "Río Grande", :region => "V"},
    "2965"   => {:city => "Trelew", :region => "U"},
    "2966"   => {:city => "Río Gallegos", :region => "Z"},
    "297"    => {:city => "Comodoro Rivadavia", :region => "U"},
    "2972"   => {:city => "San Martín de Los Andes", :region => "Q"},
    "2982"   => {:city => "Orense", :region => "B"},
    "2983"   => {:city => "Tres Arroyos", :region => "B"},
    "299"    => {:city => "Neuquén", :region => "Q"},
    "3327"   => {:city => "Lopez Camelo", :region => "B"},
    "3329"   => {:city => "San Pedro", :region => "B"},
    "3382"   => {:city => "Rufino", :region => "S"},
    "3385"   => {:city => "Laboulaye", :region => "X"},
    "3387"   => {:city => "Bouchard", :region => "X"},
    "3388"   => {:city => "General Villegas", :region => "B"},
    "3400"   => {:city => "Villa Constitución", :region => "S"},
    "3401"   => {:city => "El Trebol", :region => "S"},
    "3402"   => {:city => "Arroyo Seco", :region => "S"},
    "3404"   => {:city => "San Carlos Centro", :region => "S"},
    "3405"   => {:city => "San Javier", :region => "S"},
    "3406"   => {:city => "San Jorge", :region => "S"},
    "3407"   => {:city => "Ramallo", :region => "B"},
    "3408"   => {:city => "San Cristóbal", :region => "S"},
    "3409"   => {:city => "Moises Ville", :region => "S"},
    "341"    => {:city => "Rosario", :region => "S"},
    "342"    => {:city => "Santa Fe", :region => "S"},
    "343"    => {:city => "Paraná", :region => "E"},
    "3435"   => {:city => "Nogoyá", :region => "E"},
    "3436"   => {:city => "Victoria", :region => "E"},
    "3437"   => {:city => "La Paz", :region => "E"},
    "3438"   => {:city => "Bovril", :region => "E"},
    "3442"   => {:city => "Concepción del Uruguay", :region => "E"},
    "3444"   => {:city => "Gualeguay", :region => "E"},
    "3445"   => {:city => "Rosario del Tala", :region => "E"},
    "3446"   => {:city => "Gualeguaychú", :region => "E"},
    "3447"   => {:city => "Colón", :region => "E"},
    "345"    => {:city => "Concordia", :region => "E"},
    "3454"   => {:city => "Federal", :region => "E"},
    "3455"   => {:city => "Villaguay", :region => "E"},
    "3456"   => {:city => "Chajarí", :region => "E"},
    "3458"   => {:city => "San José de Feliciano", :region => "E"},
    "3460"   => {:city => "Santa Teresa", :region => "S"},
    "3461"   => {:city => "San Nicolás", :region => "B"},
    "3462"   => {:city => "Venado Tuerto", :region => "S"},
    "3463"   => {:city => "Canals", :region => "X"},
    "3464"   => {:city => "Casilda", :region => "S"},
    "3465"   => {:city => "Firmat", :region => "S"},
    "3466"   => {:city => "Barrancas", :region => "S"},
    "3467"   => {:city => "Cruz Alta", :region => "X"},
    "3468"   => {:city => "Corral de Bustos", :region => "X"},
    "3469"   => {:city => "Acebal", :region => "S"},
    "3471"   => {:city => "Cañada de Gomez", :region => "S"},
    "3472"   => {:city => "Marcos Juárez", :region => "X"},
    "3476"   => {:city => "San Lorenzo", :region => "S"},
    "3482"   => {:city => "Reconquista", :region => "S"},
    "3483"   => {:city => "Vera", :region => "S"},
    "3487"   => {:city => "Zárate", :region => "B"},
    "3488"   => {:city => "Escobar", :region => "B"},
    "3489"   => {:city => "Campana", :region => "B"},
    "3491"   => {:city => "Ceres", :region => "S"},
    "3492"   => {:city => "Rafaela", :region => "S"},
    "3493"   => {:city => "Sunchales", :region => "S"},
    "3496"   => {:city => "Esperanza", :region => "S"},
    "3497"   => {:city => "Llambi Campbell", :region => "S"},
    "3498"   => {:city => "San Justo", :region => "S"},
    "351"    => {:city => "Córdoba", :region => "X"},
    "3521"   => {:city => "Dean Funes", :region => "X"},
    "3522"   => {:city => "Villa de Maria de Río Seco", :region => "X"},
    "3524"   => {:city => "Villa del Totoral", :region => "X"},
    "3525"   => {:city => "Jesús María", :region => "X"},
    "353"    => {:city => "Villa María", :region => "X"},
    "3532"   => {:city => "Oliva", :region => "X"},
    "3533"   => {:city => "Las Varillas", :region => "X"},
    "3534"   => {:city => "Bell Ville", :region => "X"},
    "3541"   => {:city => "Villa Carlos Paz", :region => "X"},
    "3542"   => {:city => "Salsacate", :region => "X"},
    "3543"   => {:city => "Argüello", :region => "X"},
    "3544"   => {:city => "Villa Dolores", :region => "X"},
    "3546"   => {:city => "Santa Rosa de Calamuchita", :region => "X"},
    "3547"   => {:city => "Alta Gracia", :region => "X"},
    "3548"   => {:city => "La Falda", :region => "X"},
    "3549"   => {:city => "Cruz del Eje", :region => "X"},
    "3562"   => {:city => "Morteros", :region => "X"},
    "3563"   => {:city => "Balnearia", :region => "X"},
    "3564"   => {:city => "San Francisco", :region => "X"},
    "3571"   => {:city => "Río Tercero", :region => "X"},
    "3572"   => {:city => "Río Segundo", :region => "X"},
    "3573"   => {:city => "Villa del Rosario", :region => "X"},
    "3574"   => {:city => "Río Primero", :region => "X"},
    "3575"   => {:city => "La Puerta", :region => "X"},
    "3576"   => {:city => "Arroyito", :region => "X"},
    "358"    => {:city => "Río Cuarto", :region => "X"},
    "3582"   => {:city => "Sampacho", :region => "X"},
    "3583"   => {:city => "Vicuña Mackenna", :region => "X"},
    "3584"   => {:city => "La Carlota", :region => "X"},
    "3585"   => {:city => "Adelia María", :region => "X"},
    "3711"   => {:city => "Ingeniero Guillermo N. Juárez", :region => "P"},
    "3715"   => {:city => "Las Lomitas", :region => "P"},
    "3716"   => {:city => "Ibarreta", :region => "P"},
    "3717"   => {:city => "Formosa", :region => "P"},
    "3718"   => {:city => "Clorinda", :region => "P"},
    "3721"   => {:city => "Charadai", :region => "H"},
    "3722"   => {:city => "Resistencia", :region => "H"},
    "3725"   => {:city => "General José de San Martín", :region => "H"},
    "3731"   => {:city => "Charata", :region => "H"},
    "3732"   => {:city => "Presidencia Roque Saenz Peña", :region => "H"},
    "3734"   => {:city => "Presidencia de La Plaza", :region => "H"},
    "3735"   => {:city => "Villa Angela", :region => "H"},
    "3741"   => {:city => "Bernardo de Irigoyen", :region => "N"},
    "3743"   => {:city => "Puerto Rico", :region => "N"},
    "3751"   => {:city => "Eldorado", :region => "N"},
    "3752"   => {:city => "Posadas", :region => "N"},
    "3754"   => {:city => "Leandro N. Alem", :region => "N"},
    "3755"   => {:city => "Oberá", :region => "N"},
    "3756"   => {:city => "Santo Tomé", :region => "W"},
    "3757"   => {:city => "Puerto Iguazú", :region => "N"},
    "3758"   => {:city => "Apostoles", :region => "N"},
    "3772"   => {:city => "Paso de los Libres", :region => "W"},
    "3773"   => {:city => "Mercedes", :region => "W"},
    "3774"   => {:city => "Curuzú Cuatiá", :region => "W"},
    "3775"   => {:city => "Monte Caseros", :region => "W"},
    "3777"   => {:city => "Goya", :region => "W"},
    "3781"   => {:city => "Caa Cati", :region => "W"},
    "3782"   => {:city => "Saladas", :region => "W"},
    "3783"   => {:city => "Corrientes", :region => "W"},
    "3786"   => {:city => "Ituzaingó", :region => "W"},
    "381"    => {:city => "San Miguel de Tucumán", :region => "T"},
    "3821"   => {:city => "Chepes", :region => "F"},
    "3822"   => {:city => "La Rioja", :region => "F"},
    "3825"   => {:city => "Chilecito", :region => "F"},
    "3826"   => {:city => "Chamical", :region => "F"},
    "3827"   => {:city => "Aimogasta", :region => "F"},
    "3832"   => {:city => "Recreo", :region => "K"},
    "3833"   => {:city => "Catamarca", :region => "K"},
    "3835"   => {:city => "Andalgala", :region => "K"},
    "3837"   => {:city => "Tinogasta", :region => "K"},
    "3838"   => {:city => "Santa María", :region => "K"},
    "3841"   => {:city => "Monte Quemado", :region => "G"},
    "3843"   => {:city => "Quimili", :region => "G"},
    "3844"   => {:city => "Añatuya", :region => "G"},
    "3845"   => {:city => "Loreto", :region => "G"},
    "3846"   => {:city => "Tintina", :region => "G"},
    "385"    => {:city => "Santiago del Estero", :region => "G"},
    "3854"   => {:city => "Frías", :region => "G"},
    "3855"   => {:city => "Suncho Corral", :region => "G"},
    "3856"   => {:city => "Ojo de Agua", :region => "G"},
    "3857"   => {:city => "Bandera", :region => "G"},
    "3858"   => {:city => "Termas de Río Hondo", :region => "G"},
    "3861"   => {:city => "Nueva Esperanza", :region => "G"},
    "3862"   => {:city => "Trancas", :region => "T"},
    "3863"   => {:city => "Monteros", :region => "T"},
    "3865"   => {:city => "Concepción", :region => "T"},
    "3867"   => {:city => "Tafí del Valle", :region => "T"},
    "3868"   => {:city => "Cafayate", :region => "A"},
    "3869"   => {:city => "Ranchillos", :region => "T"},
    "387"    => {:city => "Salta", :region => "A"},
    "3875"   => {:city => "Tartagal", :region => "A"},
    "3876"   => {:city => "Metan", :region => "A"},
    "3877"   => {:city => "Joaquín V. González", :region => "A"},
    "3878"   => {:city => "Oran", :region => "A"},
    "388"    => {:city => "San Salvador de Jujuy", :region => "Y"},
    "3884"   => {:city => "San Pedro", :region => "Y"},
    "3885"   => {:city => "La Quiaca", :region => "Y"},
    "3886"   => {:city => "Libertador General San Martín", :region => "Y"},
    "3887"   => {:city => "Humahuaca", :region => "Y"},
    "3891"   => {:city => "La Madrid", :region => "T"},
    "3892"   => {:city => "Amaicha del Valle", :region => "T"},
    "3894"   => {:city => "Burruyacu", :region => "T"}
  }
end
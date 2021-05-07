allcoords <- data.frame( 
  name = c("Shakawe AWS","Pandamatenga", "Mababe", "Tubu (Okavango Delta)", "Sowa",
           "Ghanzi", "Xade", "Baines Drift", "Mahalapye","Lephepe", "Ngwatle", "Tshane", 
           "Ramotswa", "Ranaka", "Mogobane", "Lotlhakane East", "Werda","Goodhope","Tsabong",
		   "Okangwati AWS","Okalongo AWS", "Mahenene", "Omafo",
           "Kalimbeza", "Marienflusstal", "Sachinga", "Ogongo",
           "Oshaambelo", "Mashare", "Ngoma", "Dudukabbe",
           "Bagani", "Hamoye ", "Kaoko Otavi", "Alex Muranda Livestock Development Centre",
           "Okashana (Station ID: 109)","Okapya","Sonop Research Station",
           "Giribesvlakte","Mannheim","Kanovlei (Station ID: 31202)","Tsumkwe Breeding Station (Station ID: 31204)",
           "John Pandeni (Station ID: 114)","Konop Pos (Station ID: 80493)","Mopanie Pos 6 (Station ID: 80498)", "Khorixas (Station ID: 75823)",
           "Waterberg (Station ID: 31205)", "Omatjenne (Station ID: 105)", "Okomumbonde","Omatako Ranch",
           "Erichsfelde","Okahandja (NRFC)","Okamboro","Sandveld",
           "Wlotzkasbaken","Windhoek (NBRI)","Windhoek (Satellite)","Claratal",
           "Marble Koppie","Kleinberg-FN","Kleinberg","Sophies Hoogte",
           "Salt Works","Coastal Met (Station ID: E7631)","Vogelfederberg (Station ID: E7626)","Garnet Koppie (Station ID: E7628)",
           "Narais - Duruchaus  (Station ID: 31206)","Station 8 (Station ID: E7627)","Rooisand (Station ID: 103)","Aussinanis",
           "Gobabeb Met (Station ID: 8893)", "Tsumis (Station ID: 110) ","Conception Water","Dieprivier (Namib Desert Lodge)",
           "Koichab Pan","Gellap Ost", "Aurus Mountain","Karios (Gondwana Canyon Lodge)"),
  lat = c(-18.368556,-18.544627, -19.018, -19.35786, -20.547417,
          -21.715083, -22.34072, -22.48983, -23.112528,
          -23.365639, -23.71239, -24.019278, -24.88, 
          -24.9, -24.98, -25.08, -25.268, -25.46025, -26.031361,
		  -17.43025, -17.43876, -17.44433333, -17.44754, 
          -17.544722, -17.608856, -17.673667, -17.678528, 
          -17.84286111, -17.8976389, -17.8995, -17.91521,
          -18.094639, -18.23475, -18.300233, 	-18.3643,
          -18.41111111, -18.4725, -19.072806, -19.095699,
          -19.16861111,  	-19.332694, -19.6156, -19.707778,
          -20.168004, -20.256738, -20.378917, -20.3971,
          -20.44277778, -20.48327,  	-21.5094, -21.5986,
          -22.00563889, -22.009494,  	-22.0445,  	-22.3149,
          -22.5707,  	-22.57238, -22.7876,	-22.96948104,
          -22.98927901,  	-22.9895, -23.00681496, -23.023522,
          -23.05631001, -23.097969,  	-23.115385, -23.12125,
          -23.26530003, -23.294528, -23.443536, -23.560437,
          -23.72977778,  -24.015325,  	-24.1296, -26.207611,
          -26.4011, -27.645583, -27.6745),
  long = c(21.839306,25.635832, 23.96669, 22.284, 26.078417,
           21.653167, 23.02983, 28.69675, 26.859222,
           25.847194, 21.07972, 21.868556, 25.88,
           25.45, 25.7,25.43, 23.259194, 25.426778, 22.400861,
		   13.2781, 15.33196, 14.78480556, 15.89054, 
           24.526694, 12.601809, 24.031889, 15.294806,
           14.77008333, 20.2122777, 24.707944, 24.50457,
           21.559972, 19.732306, 13.659833, 19.2562,
           16.63852778, 17.33908333, 18.94111, 13.326114,
           17.76305556, 19.481083, 20.442, 18.035278,
           14.964558, 15.067175,  14.969517, 17.3529,
           16.49333333,  	17.343167, 16.7291, 16.9012,
           16.91797222, 17.041386, 19.1321, 14.4621,
           17.0957, 17.094806,  16.8144, 14.98967998,
           14.72792999, 14.728167, 14.89086597, 14.463172,
           14.62594704, 15.02903201, 15.30503601,  16.900611,
           15.05627202,  	16.114667, 15.04594199,	15.040998,
           17.19386111, 14.550375,  15.8947, 15.863,
           18.0072,  	16.316028, 17.8195),
  desc = c("Shakawe AWS","Pandamatenga", "Mababe", "Tubu (Okavango Delta)", "Sowa",
           "Ghanzi", "Xade", "Baines Drift", "Mahalapye","Lephepe", "Ngwatle", "Tshane", 
           "Ramotswa", "Ranaka", "Mogobane", "Lotlhakane East", "Werda","Goodhope","Tsabong",
		   "Okangwati AWS","Okalongo AWS", "Mahenene", "Omafo",
           "Kalimbeza", "Marienflusstal", "Sachinga", "Ogongo",
           "Oshaambelo", "Mashare", "Ngoma", "Dudukabbe",
           "Bagani", "Hamoye ", "Kaoko Otavi", "Alex Muranda Livestock Development Centre",
           "Okashana (Station ID: 109)","Okapya","Sonop Research Station",
           "Giribesvlakte","Mannheim","Kanovlei (Station ID: 31202)","Tsumkwe Breeding Station (Station ID: 31204)",
           "John Pandeni (Station ID: 114)","Konop Pos (Station ID: 80493)","Mopanie Pos 6 (Station ID: 80498)", "Khorixas (Station ID: 75823)",
           "Waterberg (Station ID: 31205)", "Omatjenne (Station ID: 105)", "Okomumbonde","Omatako Ranch",
           "Erichsfelde","Okahandja (NRFC)","Okamboro","Sandveld",
           "Wlotzkasbaken","Windhoek (NBRI)","Windhoek (Satellite)","Claratal",
           "Marble Koppie","Kleinberg-FN","Kleinberg","Sophies Hoogte",
           "Salt Works","Coastal Met (Station ID: E7631)","Vogelfederberg (Station ID: E7626)","Garnet Koppie (Station ID: E7628)",
           "Narais - Duruchaus  (Station ID: 31206)","Station 8 (Station ID: E7627)","Rooisand (Station ID: 103)","Aussinanis",
           "Gobabeb Met (Station ID: 8893)", "Tsumis (Station ID: 110) ","Conception Water","Dieprivier (Namib Desert Lodge)",
           "Koichab Pan","Gellap Ost", "Aurus Mountain","Karios (Gondwana Canyon Lodge)")
)





{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;\red84\green84\blue83;\red204\green204\blue202;
\red74\green142\blue209;\red214\green214\blue211;\red168\green198\blue150;\red102\green119\blue136;\red36\green168\blue106;
}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;\cssrgb\c40347\c40345\c39944;\cssrgb\c83858\c83855\c83021;
\cssrgb\c35408\c63180\c85581;\cssrgb\c87023\c87019\c86153;\cssrgb\c71186\c80954\c65244;\cssrgb\c47460\c54211\c60407;\cssrgb\c13899\c70594\c49064;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww34000\viewh21460\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \cb2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec3 -- Drop tables if they exist\strokec4 \
DROP \strokec5 TABLE\strokec4  IF EXISTS payments CASCADE\strokec6 ;\strokec4 \
DROP \strokec5 TABLE\strokec4  IF EXISTS bookings CASCADE\strokec6 ;\strokec4 \
DROP \strokec5 TABLE\strokec4  IF EXISTS flights CASCADE\strokec6 ;\strokec4 \
DROP \strokec5 TABLE\strokec4  IF EXISTS passengers CASCADE\strokec6 ;\strokec4 \
DROP \strokec5 TABLE\strokec4  IF EXISTS airports CASCADE\strokec6 ;\strokec4 \
DROP \strokec5 TABLE\strokec4  IF EXISTS airlines CASCADE\strokec6 ;\strokec4 \
\
\strokec3 -- 1. Create airlines table\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec5 CREATE\strokec4  \strokec5 TABLE\strokec4  airlines \strokec6 (\strokec4 \
    airline_id SERIAL \strokec5 PRIMARY\strokec4  KEY\strokec6 ,\strokec4 \
    airline_name VARCHAR\strokec6 (\strokec7 255\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    airline_code VARCHAR\strokec6 (\strokec7 10\strokec6 )\strokec4  \strokec5 UNIQUE\strokec6 ,\strokec4 \
    country VARCHAR\strokec6 (\strokec7 100\strokec6 )\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 );\strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec3 -- 2. Create airports table\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec5 CREATE\strokec4  \strokec5 TABLE\strokec4  airports \strokec6 (\strokec4 \
    airport_id SERIAL \strokec5 PRIMARY\strokec4  KEY\strokec6 ,\strokec4 \
    airport_code VARCHAR\strokec6 (\strokec7 10\strokec6 )\strokec4  \strokec5 UNIQUE\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    airport_name VARCHAR\strokec6 (\strokec7 255\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    city VARCHAR\strokec6 (\strokec7 100\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    country VARCHAR\strokec6 (\strokec7 100\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 );\strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec3 -- 3. Create flights table\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec5 CREATE\strokec4  \strokec5 TABLE\strokec4  flights \strokec6 (\strokec4 \
    flight_id SERIAL \strokec5 PRIMARY\strokec4  KEY\strokec6 ,\strokec4 \
    flight_number VARCHAR\strokec6 (\strokec7 20\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    airline_id INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    departure_airport_id INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    arrival_airport_id INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    departure_time TIMESTAMP \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    arrival_time TIMESTAMP \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    price DECIMAL\strokec6 (\strokec7 10\strokec6 ,\strokec7 2\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    available_seats INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    \
    \strokec5 FOREIGN\strokec4  KEY \strokec6 (\strokec4 airline_id\strokec6 )\strokec4  \strokec5 REFERENCES\strokec4  airlines\strokec6 (\strokec4 airline_id\strokec6 ),\strokec4 \
    \strokec5 FOREIGN\strokec4  KEY \strokec6 (\strokec4 departure_airport_id\strokec6 )\strokec4  \strokec5 REFERENCES\strokec4  airports\strokec6 (\strokec4 airport_id\strokec6 ),\strokec4 \
    \strokec5 FOREIGN\strokec4  KEY \strokec6 (\strokec4 arrival_airport_id\strokec6 )\strokec4  \strokec5 REFERENCES\strokec4  airports\strokec6 (\strokec4 airport_id\strokec6 ),\strokec4 \
    \
    \strokec5 CONSTRAINT\strokec4  check_price_positive \strokec5 CHECK\strokec4  \strokec6 (\strokec4 price \strokec8 >\strokec4  \strokec7 0\strokec6 ),\strokec4 \
    \strokec5 CONSTRAINT\strokec4  check_seats_positive \strokec5 CHECK\strokec4  \strokec6 (\strokec4 available_seats \strokec8 >=\strokec4  \strokec7 0\strokec6 )\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 );\strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec3 -- 4. Create passengers table\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec5 CREATE\strokec4  \strokec5 TABLE\strokec4  passengers \strokec6 (\strokec4 \
    passenger_id SERIAL \strokec5 PRIMARY\strokec4  KEY\strokec6 ,\strokec4 \
    first_name VARCHAR\strokec6 (\strokec7 100\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    last_name VARCHAR\strokec6 (\strokec7 100\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    email VARCHAR\strokec6 (\strokec7 255\strokec6 ),\strokec4 \
    phone VARCHAR\strokec6 (\strokec7 20\strokec6 ),\strokec4 \
    passport_number VARCHAR\strokec6 (\strokec7 50\strokec6 )\strokec4  \strokec5 UNIQUE\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    nationality VARCHAR\strokec6 (\strokec7 100\strokec6 )\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 );\strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec3 -- 5. Create bookings table\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec5 CREATE\strokec4  \strokec5 TABLE\strokec4  bookings \strokec6 (\strokec4 \
    booking_id SERIAL \strokec5 PRIMARY\strokec4  KEY\strokec6 ,\strokec4 \
    flight_id INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    passenger_id INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    seat_number VARCHAR\strokec6 (\strokec7 10\strokec6 ),\strokec4 \
    status VARCHAR\strokec6 (\strokec7 20\strokec6 )\strokec4  \strokec5 DEFAULT\strokec4  \strokec9 'pending'\strokec6 ,\strokec4 \
    total_price DECIMAL\strokec6 (\strokec7 10\strokec6 ,\strokec7 2\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    booking_date TIMESTAMP \strokec5 DEFAULT\strokec4  CURRENT_TIMESTAMP\strokec6 ,\strokec4 \
    \
    \strokec5 FOREIGN\strokec4  KEY \strokec6 (\strokec4 flight_id\strokec6 )\strokec4  \strokec5 REFERENCES\strokec4  flights\strokec6 (\strokec4 flight_id\strokec6 ),\strokec4 \
    \strokec5 FOREIGN\strokec4  KEY \strokec6 (\strokec4 passenger_id\strokec6 )\strokec4  \strokec5 REFERENCES\strokec4  passengers\strokec6 (\strokec4 passenger_id\strokec6 ),\strokec4 \
    \
    \strokec5 CONSTRAINT\strokec4  check_total_price_positive \strokec5 CHECK\strokec4  \strokec6 (\strokec4 total_price \strokec8 >\strokec4  \strokec7 0\strokec6 )\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 );\strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec3 -- 6. Create payments table\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec5 CREATE\strokec4  \strokec5 TABLE\strokec4  payments \strokec6 (\strokec4 \
    payment_id SERIAL \strokec5 PRIMARY\strokec4  KEY\strokec6 ,\strokec4 \
    booking_id INTEGER \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    amount DECIMAL\strokec6 (\strokec7 10\strokec6 ,\strokec7 2\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    payment_method VARCHAR\strokec6 (\strokec7 50\strokec6 )\strokec4  \strokec8 NOT\strokec4  \strokec8 NULL\strokec6 ,\strokec4 \
    payment_status VARCHAR\strokec6 (\strokec7 20\strokec6 ),\strokec4 \
    transaction_id VARCHAR\strokec6 (\strokec7 100\strokec6 ),\strokec4 \
    payment_date TIMESTAMP \strokec5 DEFAULT\strokec4  CURRENT_TIMESTAMP\strokec6 ,\strokec4 \
    \
    \strokec5 FOREIGN\strokec4  KEY \strokec6 (\strokec4 booking_id\strokec6 )\strokec4  \strokec5 REFERENCES\strokec4  bookings\strokec6 (\strokec4 booking_id\strokec6 ),\strokec4 \
    \
    \strokec5 CONSTRAINT\strokec4  check_amount_positive \strokec5 CHECK\strokec4  \strokec6 (\strokec4 amount \strokec8 >\strokec4  \strokec7 0\strokec6 )\strokec4 \
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 );\strokec4 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec3 -- Insert sample data\strokec4 \
INSERT \strokec5 INTO\strokec4  airlines \strokec6 (\strokec4 airline_name\strokec6 ,\strokec4  airline_code\strokec6 ,\strokec4  country\strokec6 )\strokec4  VALUES\
\pard\pardeftab720\partightenfactor0
\cf0 \strokec6 (\strokec9 'Turkish Airlines'\strokec6 ,\strokec4  \strokec9 'TK'\strokec6 ,\strokec4  \strokec9 'Turkey'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'Pegasus Airlines'\strokec6 ,\strokec4  \strokec9 'PC'\strokec6 ,\strokec4  \strokec9 'Turkey'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'British Airways'\strokec6 ,\strokec4  \strokec9 'BA'\strokec6 ,\strokec4  \strokec9 'United Kingdom'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'Lufthansa'\strokec6 ,\strokec4  \strokec9 'LH'\strokec6 ,\strokec4  \strokec9 'Germany'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'AIR MAROC'\strokec6 ,\strokec4  \strokec9 'RAM'\strokec6 ,\strokec4  \strokec9 'MOROCCO'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'QATAR Airways'\strokec6 ,\strokec4  \strokec9 'QAA'\strokec6 ,\strokec4  \strokec9 'QATAR'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'Emirates'\strokec6 ,\strokec4  \strokec9 'EK'\strokec6 ,\strokec4  \strokec9 'UAE'\strokec6 );\strokec4 \
\
INSERT \strokec5 INTO\strokec4  airports \strokec6 (\strokec4 airport_code\strokec6 ,\strokec4  airport_name\strokec6 ,\strokec4  city\strokec6 ,\strokec4  country\strokec6 )\strokec4  VALUES\
\strokec6 (\strokec9 'IST'\strokec6 ,\strokec4  \strokec9 'Istanbul Airport'\strokec6 ,\strokec4  \strokec9 'Istanbul'\strokec6 ,\strokec4  \strokec9 'Turkey'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'ESB'\strokec6 ,\strokec4  \strokec9 'Ankara Esenbo\uc0\u287 a Airport'\strokec6 ,\strokec4  \strokec9 'Ankara'\strokec6 ,\strokec4  \strokec9 'Turkey'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'CMN'\strokec6 ,\strokec4  \strokec9 'Mohammed VI'\strokec6 ,\strokec4  \strokec9 'Casablanca'\strokec6 ,\strokec4  \strokec9 'Morocco'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'LHR'\strokec6 ,\strokec4  \strokec9 'Heathrow Airport'\strokec6 ,\strokec4  \strokec9 'London'\strokec6 ,\strokec4  \strokec9 'United Kingdom'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'CDG'\strokec6 ,\strokec4  \strokec9 'Charles de Gaulle Airport'\strokec6 ,\strokec4  \strokec9 'Paris'\strokec6 ,\strokec4  \strokec9 'France'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'FRA'\strokec6 ,\strokec4  \strokec9 'Frankfurt Airport'\strokec6 ,\strokec4  \strokec9 'Frankfurt'\strokec6 ,\strokec4  \strokec9 'Germany'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'AGA'\strokec6 ,\strokec4  \strokec9 'Agadir Airport'\strokec6 ,\strokec4  \strokec9 'Agadir'\strokec6 ,\strokec4  \strokec9 'Morocco'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'BOD'\strokec6 ,\strokec4  \strokec9 'Bordeaux Airport'\strokec6 ,\strokec4  \strokec9 'Bordeaux'\strokec6 ,\strokec4  \strokec9 'France'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'SXF'\strokec6 ,\strokec4  \strokec9 'Berlin Airport'\strokec6 ,\strokec4  \strokec9 'Berlin'\strokec6 ,\strokec4  \strokec9 'Germany'\strokec6 );\strokec4 \
\
INSERT \strokec5 INTO\strokec4  flights \strokec6 (\strokec4 flight_number\strokec6 ,\strokec4  airline_id\strokec6 ,\strokec4  departure_airport_id\strokec6 ,\strokec4  arrival_airport_id\strokec6 ,\strokec4  departure_time\strokec6 ,\strokec4  arrival_time\strokec6 ,\strokec4  price\strokec6 ,\strokec4  available_seats\strokec6 )\strokec4  VALUES\
\strokec6 (\strokec9 'TK1981'\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '2025-01-15 08:00:00'\strokec6 ,\strokec4  \strokec9 '2025-01-15 09:30:00'\strokec6 ,\strokec4  \strokec7 250.00\strokec6 ,\strokec4  \strokec7 120\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'PC862'\strokec6 ,\strokec4  \strokec7 2\strokec6 ,\strokec4  \strokec7 2\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec9 '2025-01-16 14:00:00'\strokec6 ,\strokec4  \strokec9 '2025-01-16 15:15:00'\strokec6 ,\strokec4  \strokec7 85.00\strokec6 ,\strokec4  \strokec7 95\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'BA678'\strokec6 ,\strokec4  \strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec9 '2025-01-17 11:00:00'\strokec6 ,\strokec4  \strokec9 '2025-01-17 15:30:00'\strokec6 ,\strokec4  \strokec7 300.00\strokec6 ,\strokec4  \strokec7 80\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'TK1345'\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec7 6\strokec6 ,\strokec4  \strokec9 '2025-01-18 09:30:00'\strokec6 ,\strokec4  \strokec9 '2025-01-18 14:00:00'\strokec6 ,\strokec4  \strokec7 200.00\strokec6 ,\strokec4  \strokec7 150\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'LH1198'\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec7 6\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec9 '2025-01-19 16:00:00'\strokec6 ,\strokec4  \strokec9 '2025-01-19 21:45:00'\strokec6 ,\strokec4  \strokec7 220.00\strokec6 ,\strokec4  \strokec7 110\strokec6 );\strokec4 \
\
INSERT \strokec5 INTO\strokec4  passengers \strokec6 (\strokec4 first_name\strokec6 ,\strokec4  last_name\strokec6 ,\strokec4  email\strokec6 ,\strokec4  phone\strokec6 ,\strokec4  passport_number\strokec6 ,\strokec4  nationality\strokec6 )\strokec4  VALUES\
\strokec6 (\strokec9 'Omar'\strokec6 ,\strokec4  \strokec9 'Rodi'\strokec6 ,\strokec4  \strokec9 'omarrodi@email.com'\strokec6 ,\strokec4  \strokec9 '+2125551234567'\strokec6 ,\strokec4  \strokec9 'M22311992'\strokec6 ,\strokec4  \strokec9 'Morocco'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'AYA'\strokec6 ,\strokec4  \strokec9 'Ouriad'\strokec6 ,\strokec4  \strokec9 'ayaouriad@email.com'\strokec6 ,\strokec4  \strokec9 '+355556789012'\strokec6 ,\strokec4  \strokec9 'B22312243'\strokec6 ,\strokec4  \strokec9 'British'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'Ali'\strokec6 ,\strokec4  \strokec9 'Trifess'\strokec6 ,\strokec4  \strokec9 'alitrifess@email.com'\strokec6 ,\strokec4  \strokec9 '+355553456789'\strokec6 ,\strokec4  \strokec9 'B22311995'\strokec6 ,\strokec4  \strokec9 'British'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'chaimae'\strokec6 ,\strokec4  \strokec9 'zghiri'\strokec6 ,\strokec4  \strokec9 'chaimaezghiri@email.com'\strokec6 ,\strokec4  \strokec9 '+015553456789'\strokec6 ,\strokec4  \strokec9 'U22311995'\strokec6 ,\strokec4  \strokec9 'USA'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'Maria'\strokec6 ,\strokec4  \strokec9 'Schmidt'\strokec6 ,\strokec4  \strokec9 'mariaschmidt@email.com'\strokec6 ,\strokec4  \strokec9 '+212567870100'\strokec6 ,\strokec4  \strokec9 'M445566'\strokec6 ,\strokec4  \strokec9 'Morocco'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'SOFIA'\strokec6 ,\strokec4  \strokec9 'NAAIM'\strokec6 ,\strokec4  \strokec9 'sofianaiim@email.com'\strokec6 ,\strokec4  \strokec9 '+212143691643'\strokec6 ,\strokec4  \strokec9 'M442346'\strokec6 ,\strokec4  \strokec9 'Morocco'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'MALIKA'\strokec6 ,\strokec4  \strokec9 'SAMI'\strokec6 ,\strokec4  \strokec9 'malikasami@email.com'\strokec6 ,\strokec4  \strokec9 '+212135870624'\strokec6 ,\strokec4  \strokec9 'M32434'\strokec6 ,\strokec4  \strokec9 'Morocco'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'YOUSSEF'\strokec6 ,\strokec4  \strokec9 'NOSSAK'\strokec6 ,\strokec4  \strokec9 'youssefnossak@email.com'\strokec6 ,\strokec4  \strokec9 '+90378056734'\strokec6 ,\strokec4  \strokec9 'T445566'\strokec6 ,\strokec4  \strokec9 'Turkey'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'SAMIA'\strokec6 ,\strokec4  \strokec9 'SAMIH'\strokec6 ,\strokec4  \strokec9 'samiaamith@email.com'\strokec6 ,\strokec4  \strokec9 '+44123456789'\strokec6 ,\strokec4  \strokec9 'G2231677'\strokec6 ,\strokec4  \strokec9 'Germany'\strokec6 ),\strokec4 \
\strokec6 (\strokec9 'Maria'\strokec6 ,\strokec4  \strokec9 'FATIN'\strokec6 ,\strokec4  \strokec9 'mariafatin@email.com'\strokec6 ,\strokec4  \strokec9 '+013548952179'\strokec6 ,\strokec4  \strokec9 'U445566'\strokec6 ,\strokec4  \strokec9 'USA'\strokec6 );\strokec4 \
\
INSERT \strokec5 INTO\strokec4  bookings \strokec6 (\strokec4 flight_id\strokec6 ,\strokec4  passenger_id\strokec6 ,\strokec4  seat_number\strokec6 ,\strokec4  total_price\strokec6 ,\strokec4  status\strokec6 )\strokec4  VALUES\
\strokec6 (\strokec7 1\strokec6 ,\strokec4  \strokec7 1\strokec6 ,\strokec4  \strokec9 '15A'\strokec6 ,\strokec4  \strokec7 2500.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 1\strokec6 ,\strokec4  \strokec7 2\strokec6 ,\strokec4  \strokec9 '15B'\strokec6 ,\strokec4  \strokec7 2500.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 2\strokec6 ,\strokec4  \strokec7 3\strokec6 ,\strokec4  \strokec9 '22C'\strokec6 ,\strokec4  \strokec7 850.00\strokec6 ,\strokec4  \strokec9 'NotConfirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '08F'\strokec6 ,\strokec4  \strokec7 3000.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '04E'\strokec6 ,\strokec4  \strokec7 1000.00\strokec6 ,\strokec4  \strokec9 'NotConfirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '08F'\strokec6 ,\strokec4  \strokec7 2500.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '34F'\strokec6 ,\strokec4  \strokec7 3400.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '11F'\strokec6 ,\strokec4  \strokec7 3500.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 4\strokec6 ,\strokec4  \strokec9 '08F'\strokec6 ,\strokec4  \strokec7 500.00\strokec6 ,\strokec4  \strokec9 'NotConfirmed'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 4\strokec6 ,\strokec4  \strokec7 5\strokec6 ,\strokec4  \strokec9 '12D'\strokec6 ,\strokec4  \strokec7 2540.00\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 );\strokec4 \
\
INSERT \strokec5 INTO\strokec4  payments \strokec6 (\strokec4 booking_id\strokec6 ,\strokec4  amount\strokec6 ,\strokec4  payment_method\strokec6 ,\strokec4  payment_status\strokec6 ,\strokec4  transaction_id\strokec6 )\strokec4  VALUES\
\strokec6 (\strokec7 1\strokec6 ,\strokec4  \strokec7 2500.00\strokec6 ,\strokec4  \strokec9 'MASTERCARD'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'DAHGDNASD'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 2\strokec6 ,\strokec4  \strokec7 2500.00\strokec6 ,\strokec4  \strokec9 'VISA'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'AJKGFAKFF'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 3\strokec6 ,\strokec4  \strokec7 850.00\strokec6 ,\strokec4  \strokec9 'PAYPAL'\strokec6 ,\strokec4  \strokec9 'NotConfirmed'\strokec6 ,\strokec4  \strokec8 NULL\strokec6 ),\strokec4 \
\strokec6 (\strokec7 4\strokec6 ,\strokec4  \strokec7 3000.00\strokec6 ,\strokec4  \strokec9 'CASH'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'ASFASDFEA'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 5\strokec6 ,\strokec4  \strokec7 1000.00\strokec6 ,\strokec4  \strokec9 'CASH'\strokec6 ,\strokec4  \strokec9 'NotConfirmed'\strokec6 ,\strokec4  \strokec8 NULL\strokec6 ),\strokec4 \
\strokec6 (\strokec7 6\strokec6 ,\strokec4  \strokec7 2500.00\strokec6 ,\strokec4  \strokec9 'MASTERCARD'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'ASFASDFEA'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 7\strokec6 ,\strokec4  \strokec7 3400.00\strokec6 ,\strokec4  \strokec9 'PAYPAL'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'AKHGAJAD'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 8\strokec6 ,\strokec4  \strokec7 3500.00\strokec6 ,\strokec4  \strokec9 'PAYPAL'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'JGHFJDFE'\strokec6 ),\strokec4 \
\strokec6 (\strokec7 9\strokec6 ,\strokec4  \strokec7 500.00\strokec6 ,\strokec4  \strokec9 'MASTERCARD'\strokec6 ,\strokec4  \strokec9 'NotConfirmed'\strokec6 ,\strokec4  \strokec8 NULL\strokec6 ),\strokec4 \
\strokec6 (\strokec7 10\strokec6 ,\strokec4  \strokec7 2540.00\strokec6 ,\strokec4  \strokec9 'VISA'\strokec6 ,\strokec4  \strokec9 'confirmed'\strokec6 ,\strokec4  \strokec9 'SRTRSGSR'\strokec6 );\strokec4 \
\
}
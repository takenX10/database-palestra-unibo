/*-- Set params
set session my.number_of_sales = '100';
set session my.number_of_users = '100';
set session my.number_of_products = '100';
set session my.number_of_stores = '100';
set session my.number_of_coutries = '100';
set session my.number_of_cities = '30';
set session my.status_names = '5';
set session my.start_date = '2019-01-01 00:00:00';
set session my.end_date = '2020-02-01 00:00:00';

-- load the pgcrypto extension to gen_random_uuid ()
CREATE EXTENSION pgcrypto;

-- Filling of products
INSERT INTO product
select id, concat('Product ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_products')::int) as id;

-- Filling of countries
INSERT INTO country
select id, concat('Country ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_coutries')::int) as id;

-- Filling of cities
INSERT INTO city
select id
	, concat('City ', id)
	, floor(random() * (current_setting('my.number_of_coutries')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_cities')::int) as id;

-- Filling of stores
INSERT INTO store
select id
	, concat('Store ', id)
	, floor(random() * (current_setting('my.number_of_cities')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_stores')::int) as id;

-- Filling of users
INSERT INTO users
select id
	, concat('User ', id)
FROM GENERATE_SERIES(1, current_setting('my.number_of_users')::int) as id;

-- Filling of users
INSERT INTO status_name
select status_name_id
	, concat('Status Name ', status_name_id)
FROM GENERATE_SERIES(1, current_setting('my.status_names')::int) as status_name_id;

-- Filling of sales  
INSERT INTO sale
select gen_random_uuid ()
	, round(CAST(float8 (random() * 10000) as numeric), 3)
	, TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS') +
		random()* (TO_TIMESTAMP(end_date, 'YYYY-MM-DD HH24:MI:SS') 
							- TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS'))
	, floor(random() * (current_setting('my.number_of_products')::int) + 1)::int
	, floor(random() * (current_setting('my.number_of_users')::int) + 1)::int
	, floor(random() * (current_setting('my.number_of_stores')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_sales')::int) as id
	, current_setting('my.start_date') as start_date
	, current_setting('my.end_date') as end_date;

-- Filling of order_status  
INSERT INTO order_status
select gen_random_uuid ()
	, date_sale + random()* (date_sale + '5 days' - date_sale)
	, sale_id
	, floor(random() * (current_setting('my.status_names')::int) + 1)::int
from sale;
*/
INSERT INTO "giorno" VALUES ('lunedi'),('martedi'),('mercoledi'),('giovedi'),('venerdi'),('sabato'),('domenica');

INSERT INTO "palestra" VALUES 
  (1, 'palestra del borgo', 'via del borgo', true),
  (2, 'palestra flexing', 'via delel lame 2', false),
  (3, 'urban fitness', 'via luigi calori, 7', false),
  (4, 'Europalestra Eurogym', 'via de carracci', true),
  (5, 'MCfit', 'via mazzini', true);
  
INSERT INTO "corso" VALUES ('box'),('funzionale'),('fitness combat'),('kick boxing'),('spinning'),('yoga');

INSERT INTO "lavoro" VALUES ('personal trainer'),('segretaria'),('trainer'),('contabile');

INSERT INTO "attrezzo" VALUES
  (1, 'panca piana', '20/12/2020', 1),
  (2, 'panca piana', '20/12/2020', 2),
  (3, 'panca piana', '20/12/2020', 3),
  (4, 'manubri', '20/12/2020', 1),
  (5, 'manubri', '20/12/2020', 1),
  (6, 'sacco box', '22/12/2020', 4),
  (7, 'palla yoga', '22/12/2020', 5),
  (8, 'palla yoga', '22/12/2020', 5),
  (9, 'sacco box', '22/12/2020', 2),
  (10, 'disco 10kg', '22/12/2020', 2);
  
INSERT INTO "abbonamento" VALUES
  (1, 70, 'mensile_1', 1, 3),
  (2, 85, 'mensile_2', 1, 7),
  (3, 200, 'trimestrale', 3, 7),
  (4, 380, 'semestrale', 6, 7),
  (5, 650, 'annuale', 12, 7);

INSERT INTO "dipendente" VALUES 
  (1, 'Alessandro', 'Frau', 21, 1200, 'segretaria', 1),
  (2, 'Erik', 'Koci', 21, 1269, 'personal trainer', 2),
  (3, 'Daniele', 'Cacciapaglia', 20, 850, 'contabile', 2),
  (4, 'Matteo', 'Salvini', 50, 1200, 'trainer', 1),
  (5, 'Giorgia', 'Meloni', 18, 1600, 'trainer', 3),
  (6, 'Carlo', 'Calenda', 49, 1700, 'trainer', 4),
  (7, 'Silvio', 'Berlusconi', 100, 3500, 'contabile', 5);
  
INSERT INTO "iscritto" VALUES
  (1, 'Donato', 'Luciani', 21, 'Bologna', '31/02/1990', '11/09/2022', 1, 1),
  (2, 'Sandro', 'Donini', 27, 'Bologna', '31/02/1990', '13/10/2022', 3, 1),
  (3, 'Giovanna', 'Bergoglio', 35, 'Bologna', '31/02/1990', '15/07/2020', 4, 1),
  (4, 'Dino', 'Riccardi', 50, 'Bologna', '31/02/1990', '09/11/2015', 2, 2),
  (5, 'Daniele', 'Cundari', 23, 'Cesena', '31/02/1990', '11/03/2022', 2, 2),
  (6, 'Luisa', 'Beccaria', 62, 'Rimini', '31/02/1990', '11/05/2022', 4, 2),
  (7, 'Lorenzo', 'Bruscantini', 38, 'Bologna', '31/02/1990', '01/10/2017', 3, 3),
  (8, 'Liana', 'Ughi', 43, 'Rimini', '31/02/1990', '29/01/2021', 3, 3),
  (9, 'Antonio', 'Mattarella', 20, 'Bologna', '31/02/1990', '02/07/2020', 2, 3),
  (10, 'Ruggero', 'Maderno', 16, 'Bologna', '31/02/1990', '30/10/2022', 1, 5),
  (11, 'Annibale', 'Monti', 51, 'Cesena', '31/02/1990', '21/11/2018', 1, 4),
  (12, 'Stefania', 'Conte', 44, 'Riccione', '31/02/1990', '23/10/2019', 4, 5),
  (13, 'Susanna', 'Cidu', 21, 'Cagliari', '31/02/1990', '23/04/2022', 3, 5),
  (14, 'Maria', 'Cainero', 26, 'Ancona', '31/02/1990', '17/10/2020', 3, 4),
  (15, 'Lidia', 'Borromini', 37, 'Bologna', '31/02/1990', '31/08/2022', 4, 4);

  INSERT INTO "palestra_abbonamento" VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 4),
  (2, 2),
  (2, 3),
  (3, 3),
  (3, 2),
  (4, 1),
  (4, 3),
  (4, 4),
  (5, 1),
  (5, 3),
  (5, 4);

INSERT INTO "palestra_corso" VALUES
  (1, 1, 'box'),
  (2, 2, 'kick boxing'),
  (3, 3, 'yoga'),
  (4, 4, 'spinning'),
  (5, 5, 'funzionale');

INSERT INTO "corso_dipendente" VALUES
  ('box', 4),
  ('kick boxing', 2),
  ('yoga', 5),
  ('spinning', 6),
  ('funzionale', 7);
  
INSERT INTO "giorno_corsospecifico" VALUES
  ('martedi', 1,'13:30', '14:30'),
  ('giovedi', 1, '13:30', '14:30'),
  ('lunedi', 2, '16:30', '18:00'),
  ('mercoledi', 3, '10:30', '11:30'),
  ('martedi', 4, '12:30', '14:00'),
  ('venerdi', 5, '20:30', '22:00');
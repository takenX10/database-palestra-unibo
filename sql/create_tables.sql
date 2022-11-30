CREATE TABLE "palestra" (
  "id" int PRIMARY KEY,
  "nome" varchar,
  "sede" varchar,
  "sala_pesi" bool,
  "attrezzo_id" int UNIQUE NOT NULL,
  "corso_id" int UNIQUE NOT NULL,
  "dipendente_id" int UNIQUE NOT NULL,
  "abbonamento_id" int UNIQUE NOT NULL
);

CREATE TABLE "abbonamento" (
  "id" int PRIMARY KEY,
  "costo" int,
  "nome" varchar,
  "mesi_durata" int,
  "ingressi_settimanali" int,
  "corso_id" int UNIQUE NOT NULL,
  "palestra_id" int UNIQUE NOT NULL,
  "giornisettimana_id" int UNIQUE NOT NULL,
  "cliente_id" int UNIQUE NOT NULL
);

CREATE TABLE "dipendente" (
  "id" int PRIMARY KEY,
  "nome" varchar,
  "cognome" varchar,
  "eta" int,
  "stipendio" float4,
  "lavoro_id" int UNIQUE NOT NULL,
  "corso_id" int UNIQUE NOT NULL,
  "palestra_id" int UNIQUE NOT NULL,
  "cliente_id" int UNIQUE NOT NULL
);

CREATE TABLE "corso" (
  "id" int PRIMARY KEY,
  "nome" varchar,
  "giorno_con_tempo_id" int UNIQUE NOT NULL,
  "palestra_id" int UNIQUE NOT NULL,
  "dipendente_id" int UNIQUE NOT NULL,
  "abbonamento_id" int UNIQUE NOT NULL
);

CREATE TABLE "giorno_con_tempo" (
  "id" int PRIMARY KEY,
  "giorno_della_settimana" varchar,
  "ora_inizio" timestamp,
  "ora_fine" timestamp,
  "corso_id" int UNIQUE NOT NULL
);

CREATE TABLE "iscritto" (
  "id" int PRIMARY KEY,
  "nome" varchar,
  "cognome" varchar,
  "eta" int,
  "abbonamento_id" int UNIQUE NOT NULL,
  "dipendente_id" int UNIQUE NOT NULL,
  "palestra_id" int UNIQUE NOT NULL
);

CREATE TABLE "attrezzo" (
  "id" int PRIMARY KEY,
  "nome" varchar,
  "quantita" int,
  "palestra_id" int UNIQUE NOT NULL
);

CREATE TABLE "lavoro" (
  "id" int PRIMARY KEY,
  "nome" varchar,
  "dipendente_id" int UNIQUE NOT NULL
);

CREATE TABLE "iscritto_palestra" (
  "iscritto_palestra_id" int,
  "palestra_id" int,
  PRIMARY KEY ("iscritto_palestra_id", "palestra_id")
);

CREATE TABLE "iscritto_dipendente" (
  "iscritto_dipendente_id" int,
  "dipendente_id" int,
  PRIMARY KEY ("iscritto_dipendente_id", "dipendente_id")
);

CREATE TABLE "iscritto_abbonamento" (
  "iscritto_abbonamento_id" int,
  "abbonamento_id" int,
  PRIMARY KEY ("iscritto_abbonamento_id", "abbonamento_id")
);

CREATE TABLE "giorno_con_tempo_corso" (
  "giorno_con_tempo_corso_id" int,
  "corso_id" int,
  PRIMARY KEY ("giorno_con_tempo_corso_id", "corso_id")
);

CREATE TABLE "corso_palestra" (
  "corso_palestra_id" int,
  "palestra_id" int,
  PRIMARY KEY ("corso_palestra_id", "palestra_id")
);

CREATE TABLE "corso_dipendente" (
  "corso_dipendente_id" int,
  "dipendente_id" int,
  PRIMARY KEY ("corso_dipendente_id", "dipendente_id")
);

CREATE TABLE "corso_abbonamento" (
  "corso_abbonamento_id" int,
  "abbonamento_id" int,
  PRIMARY KEY ("corso_abbonamento_id", "abbonamento_id")
);

CREATE TABLE "dipendente_palestra" (
  "dipendente_palestra_id" int,
  "palestra_id" int,
  PRIMARY KEY ("dipendente_palestra_id", "palestra_id")
);

CREATE TABLE "abbonamento_palestra" (
  "abbonamento_palestra_id" int,
  "palestra_id" int,
  PRIMARY KEY ("abbonamento_palestra_id", "palestra_id")
);

CREATE TABLE "attrezzo_palestra" (
  "attrezzo_palestra_id" int,
  "palestra_id" int,
  PRIMARY KEY ("attrezzo_palestra_id", "palestra_id")
);

ALTER TABLE "iscritto_palestra" ADD FOREIGN KEY ("iscritto_palestra_id") REFERENCES "iscritto" ("palestra_id");

ALTER TABLE "iscritto_palestra" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "iscritto_dipendente" ADD FOREIGN KEY ("iscritto_dipendente_id") REFERENCES "iscritto" ("dipendente_id");

ALTER TABLE "iscritto_dipendente" ADD FOREIGN KEY ("dipendente_id") REFERENCES "dipendente" ("id");

ALTER TABLE "iscritto_abbonamento" ADD FOREIGN KEY ("iscritto_abbonamento_id") REFERENCES "iscritto" ("abbonamento_id");

ALTER TABLE "iscritto_abbonamento" ADD FOREIGN KEY ("abbonamento_id") REFERENCES "abbonamento" ("id");

ALTER TABLE "giorno_con_tempo_corso" ADD FOREIGN KEY ("giorno_con_tempo_corso_id") REFERENCES "giorno_con_tempo" ("corso_id");

ALTER TABLE "giorno_con_tempo_corso" ADD FOREIGN KEY ("corso_id") REFERENCES "corso" ("id");

ALTER TABLE "corso_palestra" ADD FOREIGN KEY ("corso_palestra_id") REFERENCES "corso" ("palestra_id");

ALTER TABLE "corso_palestra" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "corso_dipendente" ADD FOREIGN KEY ("corso_dipendente_id") REFERENCES "corso" ("dipendente_id");

ALTER TABLE "corso_dipendente" ADD FOREIGN KEY ("dipendente_id") REFERENCES "dipendente" ("id");

ALTER TABLE "corso_abbonamento" ADD FOREIGN KEY ("corso_abbonamento_id") REFERENCES "corso" ("abbonamento_id");

ALTER TABLE "corso_abbonamento" ADD FOREIGN KEY ("abbonamento_id") REFERENCES "abbonamento" ("id");

ALTER TABLE "dipendente_palestra" ADD FOREIGN KEY ("dipendente_palestra_id") REFERENCES "dipendente" ("palestra_id");

ALTER TABLE "dipendente_palestra" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "abbonamento_palestra" ADD FOREIGN KEY ("abbonamento_palestra_id") REFERENCES "abbonamento" ("palestra_id");

ALTER TABLE "abbonamento_palestra" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "attrezzo_palestra" ADD FOREIGN KEY ("attrezzo_palestra_id") REFERENCES "attrezzo" ("palestra_id");

ALTER TABLE "attrezzo_palestra" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "dipendente" ADD FOREIGN KEY ("id") REFERENCES "lavoro" ("dipendente_id");


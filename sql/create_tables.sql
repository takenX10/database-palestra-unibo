CREATE TABLE "abbonamento" (
  "id" int PRIMARY KEY NOT NULL,
  "costo" int NOT NULL,
  "nome" varchar NOT NULL,
  "mesi_durata" int NOT NULL,
  "ingressi_settimanali" int NOT NULL
);

CREATE TABLE "iscritto" (
  "codice_fiscale" int PRIMARY KEY NOT NULL,
  "nome" varchar NOT NULL,
  "cognome" varchar NOT NULL,
  "eta" int NOT NULL,
  "residenza" varchar NOT NULL,
  "data_nascita" varchar NOT NULL,
  "data_inizio_abbonamento" varchar NOT NULL,
  "id_abbonamento" int,
  "id_palestra" int
);

CREATE TABLE "palestra" (
  "id" int PRIMARY KEY NOT NULL,
  "nome" varchar NOT NULL,
  "sede" varchar NOT NULL,
  "sala_pesi" bool NOT NULL
);

CREATE TABLE "attrezzo" (
  "id" varchar PRIMARY KEY NOT NULL,
  "nome" varchar NOT NULL,
  "data_arrivo" varchar NOT NULL,
  "id_palestra" int
);

CREATE TABLE "dipendente" (
  "codice_fiscale" int PRIMARY KEY NOT NULL,
  "nome" varchar NOT NULL,
  "cognome" varchar NOT NULL,
  "eta" int NOT NULL,
  "stipendio" float4 NOT NULL,
  "id_lavoro" varchar,
  "id_palestra" int
);

CREATE TABLE "corso" (
  "nome" varchar PRIMARY KEY NOT NULL
);

CREATE TABLE "giorno" (
  "nome" varchar PRIMARY KEY NOT NULL
);

CREATE TABLE "lavoro" (
  "nome" varchar PRIMARY KEY NOT NULL
);

CREATE TABLE "palestra_abbonamento" (
  "palestra_id" int,
  "abbonamento_id" int,
  PRIMARY KEY ("palestra_id", "abbonamento_id")
);

CREATE TABLE "palestra_corso" (
  "specifico_id" int UNIQUE,
  "palestra_id" int,
  "corso_nome" varchar,
  PRIMARY KEY ("palestra_id", "corso_nome")
);

CREATE TABLE "giorno_corsospecifico" (
  "giorno_id" varchar,
  "specifico_id" int,
  "ora_inizio" varchar NOT NULL,
  "ora_fine" varchar NOT NULL,
  PRIMARY KEY ("giorno_id", "specifico_id")
);

CREATE TABLE "corso_dipendente" (
  "corso_nome" varchar,
  "dipendente_codice_fiscale" int,
  PRIMARY KEY ("corso_nome", "dipendente_codice_fiscale")
);

ALTER TABLE "iscritto" ADD FOREIGN KEY ("id_abbonamento") REFERENCES "abbonamento" ("id");

ALTER TABLE "attrezzo" ADD FOREIGN KEY ("id_palestra") REFERENCES "palestra" ("id");

ALTER TABLE "iscritto" ADD FOREIGN KEY ("id_palestra") REFERENCES "palestra" ("id");

ALTER TABLE "palestra_abbonamento" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "palestra_abbonamento" ADD FOREIGN KEY ("abbonamento_id") REFERENCES "abbonamento" ("id");

ALTER TABLE "palestra_corso" ADD FOREIGN KEY ("palestra_id") REFERENCES "palestra" ("id");

ALTER TABLE "palestra_corso" ADD FOREIGN KEY ("corso_nome") REFERENCES "corso" ("nome");

ALTER TABLE "dipendente" ADD FOREIGN KEY ("id_lavoro") REFERENCES "lavoro" ("nome");

ALTER TABLE "dipendente" ADD FOREIGN KEY ("id_palestra") REFERENCES "palestra" ("id");

ALTER TABLE "corso_dipendente" ADD FOREIGN KEY ("corso_nome") REFERENCES "corso" ("nome");

ALTER TABLE "corso_dipendente" ADD FOREIGN KEY ("dipendente_codice_fiscale") REFERENCES "dipendente" ("codice_fiscale");

ALTER TABLE "giorno_corsospecifico" ADD FOREIGN KEY ("giorno_id") REFERENCES "giorno" ("nome");

ALTER TABLE "giorno_corsospecifico" ADD FOREIGN KEY ("specifico_id") REFERENCES "palestra_corso" ("specifico_id");
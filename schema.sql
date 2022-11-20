CREATE TABLE "Videogioco" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "titolo" varchar NOT NULL,
  "data_rilascio" date
);

CREATE TABLE "Casa_Produttrice" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar NOT NULL,
  "data_creazione" date NOT NULL
);

CREATE TABLE "Lavoratore" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar NOT NULL,
  "cognome" varchar NOT NULL,
  "eta" int NOT NULL,
  "data_nascita" date NOT NULL
);

CREATE TABLE "Piattaforma" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar NOT NULL
);

CREATE TABLE "Sede" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "indirizzo" varchar NOT NULL,
  "cap" int NOT NULL
);

CREATE TABLE "Genere" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar NOT NULL
);

CREATE TABLE "Professione" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nome" varchar NOT NULL
);

CREATE TABLE "Genere_Videogioco" (
  "Genere_id" int,
  "Videogioco_id" int,
  PRIMARY KEY ("Genere_id", "Videogioco_id")
);

CREATE TABLE "Videogioco_Lavoratore" (
  "Videogioco_id" int,
  "Lavoratore_id" int,
  PRIMARY KEY ("Videogioco_id", "Lavoratore_id")
);

CREATE TABLE "Videogioco_Piattaforma" (
  "Videogioco_id" int,
  "Piattaforma_id" int,
  PRIMARY KEY ("Videogioco_id", "Piattaforma_id")
);

CREATE TABLE "Casa_Produttrice_Videogioco" (
  "Casa_Produttrice_id" int,
  "Videogioco_id" int,
  PRIMARY KEY ("Casa_Produttrice_id", "Videogioco_id")
);

CREATE TABLE "Lavoratore_Professione" (
  "Lavoratore_id" int,
  "Professione_id" int,
  "data_inizio" date NOT NULL,
  "data_fine" date,
  PRIMARY KEY ("Lavoratore_id", "Professione_id")
);

CREATE TABLE "Lavoratore_Casa_Produttrice" (
  "Lavoratore_id" int,
  "Casa_Produttrice_id" int,
  "data_inizio" date NOT NULL,
  "data_fine" date,
  PRIMARY KEY ("Lavoratore_id", "Casa_Produttrice_id")
);

ALTER TABLE "Genere_Videogioco" ADD FOREIGN KEY ("Genere_id") REFERENCES "Genere" ("id");

ALTER TABLE "Genere_Videogioco" ADD FOREIGN KEY ("Videogioco_id") REFERENCES "Videogioco" ("id");

ALTER TABLE "Videogioco_Lavoratore" ADD FOREIGN KEY ("Videogioco_id") REFERENCES "Videogioco" ("id");

ALTER TABLE "Videogioco_Lavoratore" ADD FOREIGN KEY ("Lavoratore_id") REFERENCES "Lavoratore" ("id");

ALTER TABLE "Videogioco_Piattaforma" ADD FOREIGN KEY ("Videogioco_id") REFERENCES "Videogioco" ("id");

ALTER TABLE "Videogioco_Piattaforma" ADD FOREIGN KEY ("Piattaforma_id") REFERENCES "Piattaforma" ("id");

ALTER TABLE "Casa_Produttrice_Videogioco" ADD FOREIGN KEY ("Casa_Produttrice_id") REFERENCES "Casa_Produttrice" ("id");

ALTER TABLE "Casa_Produttrice_Videogioco" ADD FOREIGN KEY ("Videogioco_id") REFERENCES "Videogioco" ("id");

ALTER TABLE "Sede" ADD FOREIGN KEY ("id") REFERENCES "Casa_Produttrice" ("id");

ALTER TABLE "Lavoratore_Professione" ADD FOREIGN KEY ("Lavoratore_id") REFERENCES "Lavoratore" ("id");

ALTER TABLE "Lavoratore_Professione" ADD FOREIGN KEY ("Professione_id") REFERENCES "Professione" ("id");

ALTER TABLE "Lavoratore_Casa_Produttrice" ADD FOREIGN KEY ("Casa_Produttrice_id") REFERENCES "Casa_Produttrice" ("id");

ALTER TABLE "Lavoratore_Casa_Produttrice" ADD FOREIGN KEY ("Lavoratore_id") REFERENCES "Lavoratore" ("id");
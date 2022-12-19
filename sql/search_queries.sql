-- Elenca le palestre
SELECT * FROM palestra;

-- Elenca gli abbonamenti di una palestra dato l'id di una palestra
SELECT abbonamento.*,palestra_abbonamento.palestra_id FROM abbonamento INNER JOIN palestra_abbonamento ON palestra_abbonamento.abbonamento_id = abbonamento.id WHERE palestra_abbonamento.palestra_id = 1;

-- Elenca gli attrezzi di una palestra dato l'id della palestra
SELECT * FROM attrezzo WHERE id_palestra = 1;

-- Elenca gli iscritti di una palestra dato l'id della palestra
select * FROM iscritto WHERE id_palestra = 1;

-- Elenca i dipendenti di una palestra dato l'id della palestra
SELECT * FROM dipendente WHERE id_palestra = 1;

-- Elenca i ruoli lavorativi svolti in una palestra dato l'id della palestra
SELECT id_lavoro FROM dipendente WHERE id_palestra=1;

-- Elenca gli attrezzi
SELECT * FROM attrezzo;

-- Elenca in quali palestre e' presente un attrezzo dato il nome
SELECT id_palestra FROM attrezzo WHERE nome='panca';

-- Mostra la palestra in cui e' situato un attrezzo dato l'id
SELECT id_palestra FROM attrezzo WHERE id=1;

-- Elenca i lavori
SELECT * FROM lavoro;

-- Elenca i dipendenti che svolgono un lavoro dato il nome del lavoro
SELECT * FROM dipendente WHERE id_lavoro = 'trainer';

-- Elenca gli abbonamenti
SELECT * FROM abbonamento;

-- Elenca quali palestre hanno un abbonamento dato l'id dell'abbonamento
SELECT palestra_id from palestra_abbonamento WHERE palestra_id=1;

-- Elenca le palestre che hanno abbonamenti di una durata in mesi specifica
SELECT 

-- Elenca quali iscritti hanno un abbonamento dato l'id

-- Elenca gli iscritti
SELECT * FROM iscritto;

-- Mostra la palestra di un iscritto dato il codice fiscale dell'iscritto
SELECT id_palestra FROM iscritto WHERE nome_iscritto;

-- Mostra l'abbonamento di un iscritto dato il codie fiscale dell'iscritto

-- Elenca i dipendenti
SELECT * FROM dipnedent;

-- Mostra il lavoro di un dipendente dato il codice fiscale di un dipendente

-- Mostra il corso svolto da un dipendente dato il codice fiscale di un dipendente

-- Mostra il nome della palestra in cui lavora un dipendente dato il codice fiscale di un dipendente

-- Elenca i corsi
SELECT * from corsi;

-- Elenca quali palestre mettono a disposizione un corso dato il nome del corso

-- Mostra il nome del dipendente che svolge un corso in una palestra dato il nome del corso e l'id della palestra

-- Elenca i dipendenti che svolgono un determinato corso dato il nome del corso

-- Elenca le palestre che offrono un corso in un determinato giorno dato il nome del corso e il nome del giorno

-- Elenca i giorni in cui una palestra offre un corso dato l'id della palestra e il nome del corso

-- Elenca i corsi offerti da una palestra in un giorno dato il nome del giorno e l'id della palestra

-- Elenca i corsi offerti da una palestra dato l'id della palestra

-- Elenca in che giorni e' presente almeno un corso in palestra dato l'id della palestra

-- Elenca in che giorni e' disponibile un corso dato l'id del corso (qualsiasi palestra), scrivendo l'id della palestra
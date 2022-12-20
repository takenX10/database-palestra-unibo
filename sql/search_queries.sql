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
SELECT id_palestra FROM attrezzo WHERE nome='panca piana';

-- Mostra la palestra in cui e' situato un attrezzo dato l'id
SELECT id_palestra FROM attrezzo WHERE id='1';

-- Elenca i lavori
SELECT * FROM lavoro;

-- Elenca i dipendenti che svolgono un lavoro dato il nome del lavoro
SELECT * FROM dipendente WHERE id_lavoro = 'trainer';

-- Elenca gli abbonamenti
SELECT * FROM abbonamento;

-- Elenca quali palestre hanno un abbonamento dato l'id dell'abbonamento
SELECT palestra_id from palestra_abbonamento WHERE abbonamento_id=1;

-- Elenca gli id delle palestre che hanno abbonamenti data la durata in mesi dell'abbonamento
SELECT palestra_abbonamento.palestra_id FROM palestra_abbonamento INNER JOIN abbonamento ON abbonamento.id = palestra_abbonamento.abbonamento_id WHERE abbonamento.mesi_durata = 6;

-- Elenca quali iscritti hanno un abbonamento dato l'id dell'abbonamento
SELECT * FROM iscritto WHERE id_abbonamento = 1;

-- Elenca gli iscritti
SELECT * FROM iscritto;

-- Mostra la palestra di un iscritto dato il codice fiscale dell'iscritto
SELECT id_palestra FROM iscritto WHERE codice_fiscale = '2';

-- Mostra l'abbonamento di un iscritto dato il codie fiscale dell'iscritto
SELECT abbonamento.* FROM abbonamento INNER JOIN iscritto ON iscritto.id_abbonamento = abbonamento.id WHERE iscritto.codice_fiscale = 1;

-- Elenca i dipendenti
SELECT * FROM dipendente;

-- Mostra il lavoro di un dipendente dato il codice fiscale di un dipendente
SELECT lavoro.nome FROM lavoro INNER JOIN dipendente ON dipendente.id_lavoro = lavoro.nome WHERE dipendente.codice_fiscale = 1;

-- Mostra il corso svolto da un dipendente dato il codice fiscale di un dipendente
SELECT corso.* FROM corso INNER JOIN corso_dipendente ON corso_dipendente.corso_nome = corso.nome WHERE corso_dipendente.dipendente_codice_fiscale = 2;

-- Mostra il nome della palestra in cui lavora un dipendente dato il codice fiscale di un dipendente
SELECT palestra.nome FROM palestra INNER JOIN dipendente ON dipendente.id_palestra = palestra.id WHERE dipendente.codice_fiscale = 1;

-- Elenca i corsi
SELECT * from corso;

-- Elenca quali palestre mettono a disposizione un corso dato il nome del corso
SELECT palestra_corso.palestra_id FROM palestra_corso WHERE palestra_corso.corso_nome = 'box';

-- Mostra il dipendente che svolge un corso in una palestra dato il nome del corso e l'id della palestra
SELECT dipendente.* FROM dipendente INNER JOIN corso_dipendente ON corso_dipendente.dipendente_codice_fiscale = dipendente.codice_fiscale INNER JOIN palestra ON dipendente.id_palestra = palestra.id WHERE palestra.id = 1 and corso_dipendente.corso_nome = 'box';

-- Elenca i dipendenti che svolgono un determinato corso dato il nome del corso
SELECT dipendente_codice_fiscale FROM corso_dipendente WHERE corso_nome = 'box';

-- Elenca le palestre che offrono un corso in un determinato giorno dato il nome del corso e il nome del giorno
SELECT palestra_corso.palestra_id FROM palestra_corso INNER JOIN giorno_corsospecifico ON palestra_corso.specifico_id = giorno_corsospecifico.specifico_id WHERE giorno_corsospecifico.giorno_id = 'martedi' and palestra_corso.corso_nome = 'box';

-- Elenca i giorni in cui una palestra offre un corso dato l'id della palestra e il nome del corso
SELECT giorno_corsospecifico.giorno_id FROM palestra_corso INNER JOIN giorno_corsospecifico ON palestra_corso.specifico_id = giorno_corsospecifico.specifico_id WHERE palestra_corso.palestra_id = 1 and palestra_corso.corso_nome = 'box';

-- Elenca i corsi offerti da una palestra in un giorno dato il nome del giorno e l'id della palestra
SELECT palestra_corso.corso_nome FROM palestra_corso INNER JOIN giorno_corsospecifico ON palestra_corso.specifico_id = giorno_corsospecifico.specifico_id WHERE palestra_corso.palestra_id = 1 and giorno_corsospecifico.giorno_id = 'martedi';

-- Elenca i corsi offerti da una palestra dato l'id della palestra
SELECT corso_nome FROM palestra_corso WHERE palestra_id = 1;

-- Elenca in che giorni e' presente almeno un corso in palestra dato l'id della palestra
SELECT giorno_corsospecifico.giorno_id,palestra_corso.palestra_id FROM palestra_corso INNER JOIN giorno_corsospecifico ON palestra_corso.specifico_id = giorno_corsospecifico.specifico_id WHERE palestra_corso.palestra_id = 1;

-- Elenca in che giorni e' disponibile un corso dato l'id del corso (qualsiasi palestra), sapendo l'id della palestra
SELECT giorno_corsospecifico.giorno_id,palestra_corso.palestra_id FROM palestra_corso INNER JOIN giorno_corsospecifico ON palestra_corso.specifico_id = giorno_corsospecifico.specifico_id WHERE palestra_corso.corso_nome = 'box';
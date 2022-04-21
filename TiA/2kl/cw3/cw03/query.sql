-- SELECT * FROM uczniowie, ksiazki; 
-- SELECT * FROM uczniowie as u INNER JOIN ksiazki as k ON k.Id_wypozycajacego 	=u.Id_ucznia;
SELECT Nazwisko,Imie,klasa,Telefon,Autor, Wydawnictwo, Rok_wydania, Liczba_stron FROM uczniowie u, ksiazki k WHERE k.Id_wypozycajacego =u.Id_ucznia;
CREATE DATABASE cw12;
SELECT id, nazwa,opis, zdjecie FROM produkty WHERE id in(18,22,23,25);
select id, nazwa, opis, zdjecie FROM produkty WHERE Rodzaje_id = 12;
-- SELECT p.nazwa, r.nazwa FROM produkty p, rodzaje r WHERE p.Rodzaje_id=r.id AND rodzaje_id=12;
SELECT p.nazwa, r.nazwa FROM produkty p, rodzaje r WHERE p.Rodzaje_id=r.id AND opis LIKE "%Leia%";
DELETE from produkty where id = 15;

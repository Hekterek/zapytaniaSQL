-- 1)	Wylicz ile mamy leków z typem procedury DCP?
SELECT COUNT(procedure_type) as 'Ilosc lekow z procedura DCP'
FROM medicament 
WHERE procedure_type = 'DCP';

-- 2)	Wyświetl nazwy handlowe oraz datę dodania do archiwum tych leków leków, które trafiły do archiwum w grudniu 2022 r.
SELECT trade_name as 'Nazwa hadlowa', date_arch as 'Data archiwizacji'
FROM medicament
WHERE date_arch BETWEEN '2022-12-01' AND '2022-12-31';

-- 3)	Podaj liczbę polskich wytwórców leków.
SELECT COUNT(country_of_manufacture) as 'Liczba polskich wyworcow lekow'
FROM medicament_manufacturer
WHERE country_of_manufacture = 'Polska';

-- 4)	Wyświetl nazwy leków, których wytwórcą są francuskie spółki akcyjne (S.A.).
SELECT medicament.used_name as 'Nazwa leku'
FROM medicament 
JOIN medicament_manufacturer 
ON medicament.id_medicament = medicament_manufacturer.id_medicament
WHERE medicament_manufacturer.country_of_manufacture = 'Francja'
AND medicament_manufacturer.type = 'wytwórca' ;

-- 5)	Podaj ile mamy leków z każdej grupy ATC. Raport w formacie nazwa grupy ATC: ilość leków.
SELECT group_atc as 'Nazwa grupy', COUNT(group_atc) as 'Ilość leków'
FROM medicament_group_atc
GROUP BY group_atc;

-- 6)	To samo co powyżej, tylko raport zostaje zawężony do grup ATC, które mają przypisane przynajmniej 30 leków.
SELECT group_atc as 'Nazwa grupy', COUNT(group_atc) as 'Ilość leków'
FROM medicament_group_atc
GROUP BY group_atc
HAVING COUNT(group_atc) > 30;

-- 7)	To samo co w punkcie 6, ale dane posortowane malejąco po ilości leków przypisanych do danej grupy ATC (grupa z największą ilością leków na samej górze).
SELECT group_atc as 'Nazwa grupy', COUNT(group_atc) as 'Ilość leków'
FROM medicament_group_atc
GROUP BY group_atc
HAVING COUNT(group_atc) > 30
ORDER BY COUNT(group_atc) DESC;
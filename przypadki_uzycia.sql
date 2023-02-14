SELECT Cena "Cena biletów", r.nazwa "Postać", sz.gatunek "Typ sztuki"
FROM role r
JOIN sztuki sz ON r.sztuki_sz_id = sz.sz_id
JOIN (SELECT bl_id, sztuki_sz_id, round((20*cena)*0.9,2) Cena
  FROM bilety
  WHERE bl_id = 89
  ) bil
  ON (r.sztuki_sz_id=bil.sztuki_sz_id)
WHERE sz.sz_id = 103;


SELECT Sztuki.Nazwa, Sztuki.Gatunek, Scenariusze.Ilosc_stron,
(Pracownicy.Imie || ' ' || Pracownicy.Nazwisko),
aktorzy.pseudonim, aktorzy.gatunek, role.nazwa, role.typ
FROM Sztuki
INNER JOIN Scenariusze ON sztuki.scenariusze_sc_id=scenariusze.sc_id
INNER JOIN pr_sz ON sztuki.sz_id=pr_sz.sztuki_sz_id
INNER JOIN Pracownicy ON pracownicy.pr_id=pr_sz.pracownicy_pr_id
INNER JOIN role ON role.sztuki_sz_id=sztuki.sz_id
INNER JOIN aktorzy ON aktorzy.AK_ID=pracownicy.aktorzy_ak_id
WHERE aktorzy.gatunek='dramatyczny' AND Sztuki.Gatunek='dramat';


SELECT Sztuki.Nazwa, Sztuki.kasa, scenariusze.ilosc_stron, ROUND(MONTHS_BETWEEN(SYSDATE, scenariusze.data_utworzenia), 0) Jak_stara_mies,
COALESCE(scenariusze.sztuki_sz_id, 0)
FROM scenariusze
INNER JOIN Sztuki
ON scenariusze.sztuki_sz_id=sztuki.sz_id
WHERE ilosc_stron > (SELECT AVG(ilosc_stron)
                      FROM scenariusze
                      WHERE sc_id = scenariusze.sc_id)
ORDER BY kasa DESC
FETCH FIRST 4 ROWS ONLY;


SELECT sz.Nazwa, sz.kasa, avg_cena_biletu
FROM Sztuki sz JOIN
  (SELECT sztuki_sz_id, AVG(cena) avg_cena_biletu
  FROM bilety
  GROUP BY sztuki_sz_id) bil
      ON (sz.sz_id=bil.sztuki_sz_id)
WHERE sz.kasa > (SELECT AVG(kasa)
                  FROM Sztuki);
                  
                  
SELECT COUNT(*) "Ilosc uzwanych rk", SUM(waga) "Suma wagi"
FROM rekwizyty rk
WHERE rk_id IN
  (SELECT rekwizyty_rk_id
  FROM sz_rk
  WHERE rk.rk_id = sz_rk.rekwizyty_rk_id);
  
 
SELECT (TO_CHAR(data_rozpoczecia, 'YYYY-MON-DD') || ' do ' || (TO_CHAR(data_zakonczenia, 'YYYY-MON-DD'))) Kiedy_w_repertuarze, sz.Nazwa
FROM repertuary JOIN sztuki sz
ON repertuary.rp_id=sz.repertuary_rp_id
WHERE data_rozpoczecia='22/10/01';


SELECT s.nazwa, SUM(sz.kasa) "LACZNA KASA DLA SALI", s.czy_dla_niepelnosprawnych
FROM Sztuki sz
JOIN Sale s
ON sz.sale_sl_id = s.sl_id
GROUP BY s.nazwa, s.czy_dla_niepelnosprawnych
ORDER BY SUM(sz.kasa) DESC
FETCH FIRST 2 ROWS ONLY;


SELECT sz.nazwa, COUNT(b.czy_ulgowy) "SPRZEDANE BILETY ULGOWE"
FROM sztuki sz
JOIN bilety b
ON b.sztuki_sz_id = sz.sz_id
WHERE b.czy_ulgowy = 1
GROUP BY sz.nazwa;



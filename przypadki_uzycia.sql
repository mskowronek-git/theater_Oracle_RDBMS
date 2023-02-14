SELECT Cena "Cena biletów", r.nazwa "Postać", sz.gatunek "Typ sztuki"
FROM role r
JOIN sztuki sz ON r.sztuki_sz_id = sz.sz_id
JOIN (SELECT bl_id, sztuki_sz_id, round((20*cena)*0.9,2) Cena
  FROM bilety
  WHERE bl_id = 89
  ) bil
  ON (r.sztuki_sz_id=bil.sztuki_sz_id)
WHERE sz.sz_id = 103;

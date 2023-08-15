/*================================================================================
				                      MIN, MAX
================================================================================*/
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresini 
saniye cinsinden listeleyen sorguyu yaziniz */

SELECT name as Sarki_adi, min(Milliseconds)/1000 as Suresi
FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SELECT MIN(Grade), MAX(Grade)
FROM students;

/*================================================================================
				                      SUM, AVG
================================================================================*/

/* invoices tablosundaki faturaların toplam değerini listeyiniz */

SELECT SUM(total) AS Toplam_gelir
FROM invoices;

/* invoices tablosundaki faturaların ortalama değerini listeyiniz */

SELECT ROUND(AVG(total),2) as faturalarin_ortalama_degeri
FROM invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */

SELECT ROUND(AVG(Milliseconds))
FROM tracks;

SELECT name
FROM tracks
WHERE Milliseconds > 393599.0;

SELECT Name, Milliseconds
FROM tracks
WHERE Milliseconds >(SELECT ROUND(AVG(Milliseconds)) FROM tracks);

/*================================================================================
				                      GROUP BY
================================================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer, COUNT(name) AS sarki_sayisi
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/

SELECT country, COUNT(CustomerId) AS musteri_sayisi
FROM customers
GROUP BY country
ORDER BY musteri_sayisi DESC;

/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
göre gruplandırarak listeleyen sorguyu yazınız*/

SELECT country, city, COUNT(CustomerId) AS musteri_sayisi
FROM customers
GROUP BY country, city;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

SELECT BillingCountry, ROUND(AVG(total),2) AS fatura_ortalamasi
FROM invoices
GROUP BY BillingCountry;

SELECT BillingCountry, ROUND(AVG(total), 2) AS fatura_ortalamasi
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 23:59:59'
GROUP BY BillingCountry;

/*================================================================================
				                      JOINS
================================================================================*/
/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id’si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT * FROM markalar;

SELECT * FROM siparisler;

SELECT markalar.marka_id, markalar.marka_adi,
       siparisler.siparis_adedi, siparisler.siparis_tarihi
FROM markalar
INNER JOIN siparisler
ON markalar.marka_id = siparisler.marka_id;

/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id’si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT * FROM markalar;

SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi
FROM markalar m
INNER JOIN siparisler s
ON m.marka_id = s.marka_id;

/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının türünü
(genre) listeleyiniz.*/

SELECT * FROM tracks;
SELECT * FROM genres;

SELECT t.name AS Sarki_Adi, g.name AS Sarki_Turu
FROM tracks t
INNER JOIN genres g
ON t.GenreId = g.GenreId;

/* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),
soyadını (lastName), fatura tarihi (InvoiceDate) ve fatura meblağını (total) 
listeleyen sorguyu yazınız */

SELECT c.FirstName, c.lastName, i.InvoiceDate, i.total  
FROM invoices i
JOIN customers c
ON i.CustomerId = c.CustomerId;

/* artists tablosunda bulunan her bir kişinin albums tablosunda bulunan tüm
albümlerini listeleyen sorguyu yazınız. Sorguda ArtistId, Name, Title ve AlbumId
olmalıdır */

SELECT * FROM artists;
SELECT * FROM albums;

SELECT ar.ArtistId, ar.Name, al.Title, al.AlbumId
FROM artists ar
JOIN albums al
ON ar.ArtistId = al.ArtistId;















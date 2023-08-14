/*================================================================================
										LIMIT
================================================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan ilk 4 kayıt'ın InvoiceId, 
InvoiceDate ve total bilgilerini sorgulayiniz */

SELECT InvoiceId, InvoiceDate, total
FROM invoices
WHERE total > 10
LIMIT 7;

/*================================================================================
										ORDER BY
================================================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtları Total değerine göre 
ARTAN sırada sıralayarak sorgulayiniz */

SELECT *
FROM invoices
WHERE total > 10
ORDER BY total
ASC;

/*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 

SELECT *
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate
DESC
LIMIT 10;

SELECT *
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate DESC
LIMIT 10;

/*================================================================================
							LOGICAL OPERATORS (AND,OR,NOT)
================================================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre AZALAN sırada listeyiniz */

SELECT *
FROM invoices
WHERE NOT BillingCountry == 'USA'
ORDER BY total DESC;

SELECT *
FROM invoices
WHERE BillingCountry <> 'USA'
ORDER BY total DESC;

SELECT *
FROM invoices
WHERE BillingCountry != 'USA'
ORDER BY total DESC;

/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
InvoiceId sırasına göre artan sırada listeyiniz */ 

SELECT *
FROM invoices
WHERE BillingCountry == 'USA' OR BillingCountry == 'Germany'
ORDER BY InvoiceId ASC;

SELECT *
FROM invoices
WHERE BillingCountry == 'USA' OR BillingCountry == 'Germany'
ORDER BY InvoiceId;

SELECT *
FROM invoices
WHERE BillingCountry IN ("USA", "Germany")
ORDER BY InvoiceId ASC;

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN "2012-01-01" AND "2013-01-02";

SELECT *
FROM invoices
WHERE InvoiceDate >= "2012-01-01" AND InvoiceDate <= "2013-01-02";

SELECT *
FROM invoices
WHERE InvoiceDate >= "2012-01-01" AND InvoiceDate <= "2013-01-02 00:00:00";

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri
arasındaki en yeni faturayı listeleyen sorguyu yazınız */ 

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
ORDER BY InvoiceDate DESC
LIMIT 1;

/*================================================================================
										IN
================================================================================*/
/* customers tablosunda USA, Belgium, Norway veya Canada ülkelerinden sipariş veren
müşterilerin FirstName, LastName ve Country bilgilerini listeyiniz */

SELECT FirstName, LastName, Country
FROM customers
WHERE country IN ('USA', 'Belgium', 'Norway', 'Canada');

/*================================================================================
										LIKE
================================================================================*/
/* customers tablosunda ismi BEL harfleriyle başlayan bir ülkeden sipariş veren
müşterilerin FirstName, LastName ve Country bilgilerini listeyiniz */

SELECT FirstName, LastName, Country
FROM customers
WHERE Country LIKE "Bel%";

/* customers tablosunda şirket isminin içinde "Inc." karakterleri bulunan bir firmadan 
sipariş veren müşterilerin FirstName, LastName ve Country bilgilerini listeyiniz */

SELECT FirstName, LastName, Country
FROM customers
WHERE Company LIKE "%Inc.%";

/* customers tablosunda ismi "Bel_ium" a benzeyen bir ülkeden sipariş veren
müşterilerin FirstName, LastName ve Country bilgilerini listeyiniz */

SELECT FirstName, LastName, Country
FROM customers
WHERE Country LIKE "Bel_ium";

/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/

SELECT Name
FROM tracks
WHERE Composer LIKE "%Bach";

/* albums tablosunda Title (başlık) sütununda Greatest içeren kayıtların
tüm bilgilerini listeyen sorguyu yazınız*/

SELECT *
FROM albums
WHERE Title LIKE "%Greatest%";

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate)
sadece şubat aylarında gerçekleşmiş olan faturaların tüm bilgilerini
listeleyen sorguyu yazınız*/

SELECT *
FROM invoices
WHERE InvoiceDate LIKE '201_-02%';

SELECT * FROM invoices
WHERE InvoiceDate BETWEEN '2010-01-01' AND '2019-12-31' AND InvoiceDate LIKE '%-02-%';

/*================================================================================
				  AGGREGATE FUNCTION (COUNT, SUM, MIN, MAX, AVG)
================================================================================*/

/*================================================================================
				                      COUNT
================================================================================*/

/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */

SELECT COUNT(*)
FROM invoices;

SELECT COUNT(InvoiceId) AS fatura_sayisi
FROM invoices;

/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/

SELECT COUNT(DISTINCT Composer) AS bestekar_sayisi
FROM tracks;

/*================================================================================
				                      MIN, MAX
================================================================================*/




































































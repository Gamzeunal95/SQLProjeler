--Tabloları Sorgulamak için Select komutu kullanılır
-- Select <KolonAdlari> from <TabloAdi>
Select * from Customers

--Kolon seçimli sorgu
Select CompanyName,ContactName,Country,City
from Customers

--Kolonlara farklı isim verme
--1.YOL
Select CompanyName as FirmaAdi,
       ContactName as KontaktKisi,
       Country as Ulke,
       City Sehir -- as yazmadan da değişiklik yapabilirsin.
from Customers

--2.YOL
Select FirmaAdi = CompanyName,
       KontaktKisi = ContactName, --Boşluk bırakarak yazmak istersen [Kontakt Kisi]
       Ulke = Country ,
       City = Sehir 
from Customers

-- Tekil Kayıtları almak için Distinct kelimesi kullanılır. / Birden fazla kolona distinct yapmaya çalışırsan verimli sonuç alamazsın.

Select distinct Country    
From Customers

Select FirstName, City from Employees

--Kolon Birleştirme
Select FirstName , LastName from Employees
Select (TitleofCourtesy + ' ' + FirstName + ' ' + LastName) [Ad Soyad]     -- TitleofCourtesy Mr. and Mrs ekliyor
from Employees

--Verileri Filtreleme
--Bunun için where yan cümleciği kullanılır.
--Londradaki Müşterilerim

Select * from Customers
Where City = 'London'

--Londradaki Müşterilerimden fax num. Olanlar
Select * from Customers
Where City = 'London' and fax is not null

--Fax numarasi olmayan müsterilerim
Select * from Customers
Where Fax is Null

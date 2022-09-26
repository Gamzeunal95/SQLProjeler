-- Aggregate Fonksiyonlar 
--Toplam fonksiyonaları ve Gruplama fonksiyonları

--Count Fonksiyonu 
--Sorgudaki kayıt sayısını verir

-- Employee tablosundaki kayıt sayısı
Select * from Employees
select count (*)
from Employees

--İngiltereli olan personel listesi 
select count (*)
from Employees
Where Country = 'UK'

--Kayıt sayısını bulmak için
select count (EmployeeId) from Employees
--count fonksiyonu null değerleri saymaz 
select count (Region) from Employees

select count (distinct City) from Employees -- Aynı olanlarda old. için distinct ile aynı olanları almaması için aynı olan cityleri ehsaba kalmaması için city nin yanına yazdık.

--Sum : Toplama Fonksiyonu
--Ürünlerin toplam fiyatını toplamak için
select sum (UnitPrice) from Products

--Ürünlerin fiyat ortalamasını bulmak için
select sum (UnitPrice) / count (ProductId) from Products
--2.Yol
select avg (UnitPrice) from Products

--Çalışanların yaş ortalaması
select avg (datediff (year, BirthDate, getdate()))
from Employees

-- Böyle yazarsak yaşları geririr.
select datediff (year, BirthDate, getdate()) 
from Employees
-- avg kullanacaksak sayısal alan olmalı
-- Null olanlar işleme dahil edilmez.
Select avg (FirstName) from Employees  -- ÇALIŞMAZ

--MAX : Maximum değeri verir, MİN :  Minimum değeri verir.
Select max (UnitPrice) from Products
Select min (UnitPrice) from Products


Select Max (FirstName) from Employees
Select min (FirstName) from Employees
Select * from Employees
Order by FirstName
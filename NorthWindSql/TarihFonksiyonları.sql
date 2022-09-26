-- Tarih Fonksiyonları
Select * From Employees
Order by BirthDate

Select * From Employees
Where year(BirthDate)>=1960   -- 1960 ve üstü bunun farklı şekilde de sorgulayabiirin
Order by BirthDate

Select * from Orders
Where year(OrderDate) = 1996 and MONTH(OrderDate) =12
Order by OrderDate   -- OrderDate yerine hangi kolondaysa o kolonun sayısını yazabiliriz.

--DatePart Kullanımı
--Select 2*2
--Select GETDATE()

Select * from Orders
where DATEPART(year, OrderDate)  = 1996 
and DATEPART(Month , OrderDate) = 11
and DATEPART	(day, OrderDate) >15

Select FirstName,
       LastName,
       Birthdate,
       DATEPART(week,BirthDate)
from Employees

--DateDiff Kullanımı : İki tarih arasındaki farkı alır.
--Kullanımı DateDiff (İnterval,BaşlangıcTarihi,BitisTarihi)
-- Çalışanların yaşlarını bulmak için 
Select FirstName,
       LastName ,
       DateDiff (year,Birthdate, GetDate()) 
From Employees
where DateDiff (year,Birthdate, GetDate()) > 70   --Yaşı 70'den büyük olsun dedik.

Select
DatePart (hour , GETDATE ()) Saat,
DatePart (MINUTE,getDate ()) Dakika,
DatePart (Second , getDate()) Saniye ,
DatePart (MILLISECOND , GetDate ()) MilliSecond,
DatePart (MICROSECOND , GetDate ()) MicroSecond
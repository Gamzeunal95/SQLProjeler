--Soru 1
--Kargo firmalarinin tasidigi urun adetleri yillara göre dagilimi
--exec kargoSorgular KargoID,Ulke 
--Sonuc :
--Federal Shipping 1996 ,USA ,343
--Soru 2
--exec kargoSorgular KargoID,yil
--Federal Shipping 1996 ,USA ,343
--Federal Shipping 1996 ,UK ,243 
--Federal Shipping 1996 ,Germany ,343


--BİR PROCEDURE OLUŞTURDUK CREATE DİYEREK
Create procedure KargoTasimaListesi @kargoId int , @Ulke nvarchar(50)
As
Select s.CompanyName Kargo , o.ShipCountry Ulke , Sum (dt.Quantity) Adet
from  Shippers s 
join Orders o on o.ShipVia = s.ShipperID
join [Order Details] dt on dt.OrderID = o.OrderID
Where s.ShipperID = @kargoId and o.ShipCountry = @Ulke
Group by s.CompanyName , o.ShipCountry
Order by 2

--KAYDETTİİKTEN SONRA BU SORGUYLA İSTELEDİK
exec KargoTasimaListesi 1, 'USA'

-- SONUC İSTEDİĞİMİZ GİBİ GELMEDİ
-- SONRA YEAR EKLEMEK İÇİN DEĞİŞİKLİK YAPABİLMEK İÇİN ALTER PROCEDURE OLARAK BAŞLAYIP DEĞİŞİKLİK YAPTIK.
Alter procedure KargoTasimaListesi @kargoId int , @Ulke nvarchar(50)
As
Select s.CompanyName Kargo ,Year(o.OrderDate) ,o.ShipCountry Ulke , Sum (dt.Quantity) Adet
from  Shippers s 
join Orders o on o.ShipVia = s.ShipperID
join [Order Details] dt on dt.OrderID = o.OrderID
Where s.ShipperID = @kargoId and o.ShipCountry = @Ulke
Group by s.CompanyName ,Year(o.OrderDate), o.ShipCountry
Order by 2
--KAYDETTİİKTEN SONRA BU SORGUYLA İSTELEDİK
exec KargoTasimaListesi 1, 'USA'

--2.SORUNUN CEVABI
Create procedure KargoTasimaListesi2 @kargoId int , @Yil int
As
Select s.CompanyName Kargo , o.ShipCountry Ulke , Sum (dt.Quantity) Adet
from  Shippers s 
join Orders o on o.ShipVia = s.ShipperID
join [Order Details] dt on dt.OrderID = o.OrderID
Where s.ShipperID = @kargoId and year(o.OrderDate) = @Yil
Group by s.CompanyName ,Year(o.OrderDate), o.ShipCountry
Order by 2

--KAYDETTİİKTEN SONRA BU SORGUYLA İSTELEDİK
exec KargoTasimaListesi2 1 , 1997
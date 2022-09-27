--Group by Kuıllanımı

--Hangi ülkede kaç adet müşterim var
--Ya da ulkelere göre müşteri dağılımı
Select Country, count(*) --Bunların sayısı nedir count(*) - count(*) yerine count (country) de diyebilirsin.
from Customers 
Group by Country
Order by COUNT (*) desc   --Yada Order by 2 desc diyebilirsin ( 2.kolon yani counrty olduğunu anlar.)

--Müşterilerin verdiği sipariş sayısı
Select CustomerID, COUNT(*)
from Orders
Group by CustomerID

--Çalışanların aldığı sipariş sayısı
Select EmployeeID, COUNT(*)
from Orders
Group by EmployeeID

--Urunlerin kategorilere göre dağılımı 
Select CategoryID, COUNT(*)
from Products
Where UnitPrice >=20   --20 ve üzerinde fiyatı olan ürünlerin 
Group by CategoryID

--Her siparişteki toplam ürün sayısı
Select top 1 * from Orders
Select top 10* from [Order Details]


Select OrderID, COUNT(*)
from [Order Details]
Group by OrderID
Order by Count (*) desc   --Ben kullandım araştır ne için

-- Her bir siparişin cirosu nedir 
Select OrderID, sum(UnitPrice*Quantity)  -- ya da ([UnitPrice*Quantity]) kçşeli parantez ile yazabilirsin.
from [Order Details]
Group by OrderID
Order by 2 desc   -- 2 dedik uzun uzun yazmamak için 

--Çıkan siparişte en yüksek çıkan ürünün ne olduğuna bakmak için 
select * from [Order Details]
Where OrderID = 10865          -- bu siparişId'den detaylarını sorguladık
select * from Products where ProductID= 38  --Bu ürünün ne olduğuna bakmak istersek detaylardan gördüğümüz Poduct Id den sorgulayabiliriz.

-- HAVİNG KULLANIMI -> Group by sonucunda gelen veriler üzerinde filtreleme yapmak için kullanılır.
-- Cirosu 10000'den büyük olan
Select OrderID, sum([UnitPrice]*[Quantity]) as ciro
from [Order Details]
Group by OrderID
having sum([UnitPrice] * [Quantity]) < 10000      
Order by ciro desc
Select * from Categories
Select * from Products
--Sub Query
Select ProductName,
(Select CategoryName from Categories as c where c.CategoryID=p.CategoryID),
(Select CompanyName from Suppliers as s where s.SupplierID=p.SupplierID)
from Products as p

--Join2li versiyonu 
--1.Adım                
Select ProductName ,
Categories.CategoryName
from Products
inner join Categories on Categories.CategoryID = Products.CategoryID

--2.Adım 
Select ProductName,
Categories.CategoryName,
Suppliers.CompanyName
from Products
inner join Categories on Categories.CategoryID = Products.CategoryID 
inner join Suppliers on Suppliers.SupplierID = Products.SupplierID
--Table Alias Kullanımlı 
Select ProductName ,
c.CategoryName,
s.CompanyName
from Products p
inner join Categories c on c.CategoryID = p.CategoryID
inner join Suppliers s on s.SupplierID= p.SupplierID

--Eski Yöntem
Select Products.ProductName ,Categories.CategoryName, Suppliers.CompanyName
from Products,Categories,Suppliers
Where Products.CategoryID = Categories.CategoryID
and Products.SupplierID = Suppliers.SupplierID

--Table Alias Kullanımlı hali 
Select ProductName ,
c.CategoryName,
s.CompanyName
from Products p
inner join Categories c on c.CategoryID = p.CategoryID
inner join Suppliers s on s.SupplierID= p.SupplierID


-- Hangi kategoriden kaç adet ürün var
Select c.CategoryName, COUNT(p.ProductID) Adet
from Categories c
inner join Products p on c.CategoryID = p . CategoryID
group by c.CategoryName
order by 2 desc 

-- Sipariş sayısı en yüksek olan ilk 5 müşteri
select top 5 c.CompanyName, COUNT(o.CustomerID) [Siparis Sayisi]
from Customers c
inner join Orders o on o.CustomerID = c.CustomerId
group by c. CompanyName
Order by 2 desc

--Çalışanların aldığı sipariş sayısı
Select (e. FirstName + ' ' + e.LastName) Adi, 
							 COUNT(o.OrderID) Adet
from Employees e
Left join Orders o on e.EmployeeID = o.EmployeeID      --Left Join dediğimizde tüm kayıtları alır.
Group by (e. FirstName + ' ' + e.LastName)
Order by 2 desc

--Çalışanların cirolarını hesaplamak için
Select (e. FirstName + ' ' + e.LastName) Adi, 
							 COUNT(distinct o.OrderID) Adet,
							 sum(dt.UnitPrice*dt.Quantity) Ciro
from Employees e
inner join Orders o on e.EmployeeID = o.EmployeeID
inner join [Order Details] dt on dt.OrderID = o.OrderID
Group by (e. FirstName + ' ' + e.LastName)
Order by 2 desc 

--Kategorilerin satis adetleri nedir ?
Select c.CategoryName, COUNT(dt.OrderID) 
from Categories c
inner join Products p on c.CategoryID = p.CategoryID
inner join [Order Details] dt on dt.ProductID = p.ProductID
inner join Orders o on o.OrderID = dt.OrderID
where year(o.OrderDate) = 1996
Group by c. CategoryName
Order by 2 desc
-- 7 numaralı kategori ile sağlamasını yapalım
select * from Categories
select * from Products where CategoryID = 7 --(51,28,14,7,74) numaralı product'lar var 
select * from [Order Details] dt              -- Sonra bu yukarıda ki ıd lere göre sorguladık.
inner join orders o on dt.OrderID = o.OrderID
where dt.ProductID in (51,28,14,7,74)
and year(o.OrderDate) = 1996

--Çalışanların ülkelere göre yaptığı satış adetleri
select (e. FirstName + ' ' + e.LastName) Adi, 
							 o.ShipCountry,
							 COUNT(*) Adet
from Employees e
inner join Orders o on o.EmployeeID = e.EmployeeId
Group by (e. FirstName + ' ' + e.LastName), o.ShipCountry
order by 3 desc     -- Nereye göre sıralamak istersen biz Adete göre sıralamayı tercih ettik.


--Çalışanların ülkelere göre yaptığı satışların cirosu
Select (e. FirstName + ' ' + e.LastName) Adi, 
						     o.ShipCountry,
							 count (distinct o.OrderID) Adet,
                             sum(dt.Quantity*(1-Discount)*UnitPrice) Ciro
							
from Employees e
inner join Orders o on e.EmployeeID = o.EmployeeID
inner join [Order Details] dt on dt.OrderID = o.OrderID
Group by (e. FirstName + ' ' + e.LastName),o.ShipCountry
Order by 3 desc 


-- Alinan siparis sayisinin yillara göre dagılımı
Select year (OrderDate) ,DATEPART(MONTH,OrderDate) Ay , COUNT (*)
from Orders
Group by year (OrderDate), DATEPART(MONTH,OrderDate)
Order by 1,2                   --Buradaki order sıralamak anlamında Sipariş olan Order ile karıştırma.


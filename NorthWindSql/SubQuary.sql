-- SUBQUARY - İÇ İÇE SORGULAR

--Ürünler tablosunda fiyatı ortalamanın üzerinde olan ürünlerin listesi.
--Uzun Yol
declare @ortalamaFiyat money
Select @ortalamaFiyat = AVG(UnitPrice) from Products
Select * from Products 
Where UnitPrice > @ortalamaFiyat

--Kısa Yol
Select * from Products 
Where UnitPrice > (select avg (UnitPrice) from Products)

--insert into Products(ProductName,CategoryID,SupplierID,UnitPrice)   -Aşağıdaki sorguyu denemek için ekleme yaptık.
--Values ('Kola',1,1,5)

-- Hiç sipariş verilmemiş ürünleri listelemek için (Günlük hayatta kullanmasanız daha iyi maliyetli :) )
Select * from Products
Where ProductID not in (Select ProductID from [Order Details])

--insert into Employees(FirstName, LastName)   --Aşağıdaki sorguyu denemek için ekleme yaptık.
--Values ('Ali' ,'Yilmaz')

--Sipariş almayan çalışanların listesi.
select * from Employees
where not exists (Select EmployeeID from Orders where Orders.EmployeeID = Employees.EmployeeID)

-- as kullanırken kısaltmada yapabiliriz.
Select ProductName,
(Select CategoryName from Categories as c where c.CategoryID=p.CategoryID),
(Select CompanyName from Suppliers as s where s.SupplierID=p.SupplierID)
from Products as p

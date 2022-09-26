
-- Like Kullanimi
select * from Customers
where ContactTitle = 'Owner'
--2. Yol
select * from Customers
where ContactTitle like 'Owner'

--Contact Name 'i a ile baslayan musteriler
select * from Customers
where ContactName like 'a%'
--Contact Name 'i a ile bitenler 
select * from Customers
where ContactName like '%a'

--ContactName icerisinde e harfi olanlar
select * from Customers
where ContactName like '%e%'

--ContactName ikinci harfi a olanlar
select * from Customers
where ContactName like '_a%'

--Contact Name ikinci harfi a olanlar.
-- ve 4. Harfi r olanlar
Select * From Customers
Where ContactName like '_a_r%'

--ContactName alanında 2. Harfi a ya da e olanlar.
--1.YOL
Select * From Customers
Where ContactName like '_a%'
or  ContactName like '_e%'

--2.YOL
Select * From Customers
Where ContactName like '_[ae]%'

--ContactName içerisinde A ya da R olanlar.
Select * From Customers
Where ContactName like '%[ar]%'

--ContactName ilk harfi alfabetik olarak B ile F arasında olanlar.
Select * From Customers
Where ContactName like '[b-f]%'
Order by ContactName   --Orderby ile sıralı vaziyette getirme imkanımız olur.

--ContactName M ile başlamayanlar
--1.YOL
Select * From Customers
Where ContactName not like 'm%'
Order by ContactName 

--2.YOL
Select * From Customers
Where ContactName like '[^m]%'   --  Bu işarat ile ^ değilini alırız
Order by ContactName 

--ContactName M ile bitmeyenler
--1.YOL
Select * From Customers
Where ContactName not like '%m'
Order by ContactName 

--2.YOL
Select * From Customers
Where ContactName like '%[^m]'
Order by ContactName 


-- Top Kullanımı
-- İlk 10 Kaydı getirir (Bu örnekte m ile bitmeyen ilk 10 kayıt)
Select top 10 * from Customers
Where ContactName like '%[^m]'
Order by ContactName 

--İlk %10 kaydıgetirir  (Bu örnekte m ile bitmeyenerin %10 u)
Select top 10 percent * from Customers
Where ContactName like '%[^m]'
Order by ContactName 

--Eğer CalisanId dolu yil bos ise bu sorgu oluşturulacak. / 1 numaralı ıd ye sahip calısanın tüm yıllarda yaptığı satış sayıları listelenir.
Select e.FirstName, e.LastName, YEAR(o.OrderDate) yil , count(*) Adet
from Employees e 
inner join Orders o on o.EmployeeID = e. EmployeeID
Where e.EmployeeID = 1 
Group By e.FirstName , e.LastName , YEAR(o.OrderDate)


--Eğer yil dolu CalisanId bos ise bu sorgu oluşturulacak.  / 1997 yılındaki tüm calısanların aldığı sipariş sayısı gelir.
Select e.FirstName, e.LastName, YEAR(o.OrderDate) yil , count(*) Adet
from Employees e 
inner join Orders o on o.EmployeeID = e. EmployeeID
Where Year(o.OrderDate ) = 1997
Group By e.FirstName , e.LastName , YEAR(o.OrderDate)


--Her iki parametrede dolu ise bu sorgu oluşturulacak. / 1 numaralı Id ye sahip çalışanın 1997 yılında yaptığı sipariş sayıları gelir.
Select e.FirstName, e.LastName, YEAR(o.OrderDate) yil , count(*) Adet
from Employees e 
inner join Orders o on o.EmployeeID = e. EmployeeID
Where Year(o.OrderDate ) = 1997 and e.EmployeeID = 1          -- Employee Id 1 olan kişi gelir./ 1997 yılı gelir.
Group By e.FirstName , e.LastName , YEAR(o.OrderDate)


--YUKARIDA YAPILANLARA GÖRE HEPSİNİ BİR YERDE TOPLAYARAK PROCEDUR VE DYNAMİC SQL OLUŞTUR

Alter procedure CalisanlarYillaraGoreSatısDinamik 
@calisanId varchar(5) ,
@yil varchar(4)
as
begin
declare @sql varchar(max)
declare @join varchar(1000),@groupby varchar(1000),@select varchar(1000),@where varchar(1000)
if @calisanId is null 
Set @select = ' select e.FirstName,e.LastName,count(*) adet '

if @yil is null
Set @select = ' select e.FirstName,e.LastName,year(o.OrderDate) yil,count(*) adet '

if len(@calisanId)>0 and len(@yil)>0 
Set @select = ' select e.FirstName,e.LastName,count(*) adet  '

if @calisanId is null set @where = ' where YEAR(o.OrderDate) = ' + @yil

if @yil is null set @where = ' where e.EmployeeID=' + @calisanId

if len(@calisanId)>0 and len(@yil)>0 
Set @where = ' where YEAR(o.OrderDate) ='+@yil+  ' and e.EmployeeID='+@calisanId



set @join = '  from Employees e inner join Orders o on o.EmployeeID=e.EmployeeID '
set @groupby = '  group by e.FirstName,e.LastName,year(o.OrderDate) '

set @sql = @select + @join + @where + @groupby

print(@sql)
--select @sql
exec (@sql)
end


--Bu sorguyu ya da yılı/ıd yi değiştirerek sorgu atabilirsin..
exec CalisanlarYillaraGoreSatısDinamik 1,1997

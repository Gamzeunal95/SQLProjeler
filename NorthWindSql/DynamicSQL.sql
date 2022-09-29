Alter procedure DinamikKargoTasimaListesi 
@kargoId varchar(5),
@ulke nvarchar(50) =null,
@yil varchar(5) =null
as
Begin
declare @sql as varchar(max)
set @sql ='
select s.CompanyName Kargo,' 
if isnumeric(@yil)=1  
set @sql = @sql + ' o.ShipCountry Ulke,' 
else set @sql = @sql + ' year(o.OrderDate) ,'

set @sql = @sql + ' sum(dt.Quantity) Adet '
 
set @sql = @sql + ' from Shippers s 
join Orders o on o.ShipVia=s.ShipperID
join [Order Details] dt on dt.OrderID=o.OrderID 
where s.ShipperID =' + @kargoId + '  and '
if isnumeric(@yil)=1
Begin
  set @sql = @sql + ' year(o.OrderDate) =' + @yil 
  set @sql = @sql + ' Group by s.CompanyName , o.ShipCountry'
End
else
Begin
	set @sql = @sql + ' o.ShipCountry =''' + @ulke + ''''

	set @sql = @sql + ' Group by s.CompanyName , year(o.OrderDate) '
End

set @sql = @sql + ' Order by 2'


print @sql
exec (@sql)
End

--Sorgu içinde aşağıdaki gibi attık
exec DinamikKargoTasimaListesi  1,Null, 1997

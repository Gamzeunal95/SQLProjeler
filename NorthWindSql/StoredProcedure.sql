
CREATE PROCEDURE [dbo].[Toplama]
	@param1 int = 0,
	@param2 int
AS
Begin --Başlangıç demek

	SELECT @param1 +  @param2

RETURN 0

End

-- ctrl shift e diyerek kaydet .
-- Kaydettikten sonra çalıştırmak için şu sorguyu at.
exec dbo.Toplama (5,3)


-- İki Tarih Arasındaki Siparişleri Görmek için oluturduğumuz hazır procedur.
CREATE PROCEDURE [dbo].[İkiTarihArasıSiparisler]
	@BaslangicTarihi DateTime,
	@BitisTarihi DateTime
AS
Begin 

	SELECT * From Orders
	Where OrderDate between @BaslangicTarihi and @BitisTarihi

RETURN 0

End

-- Kaydettikten sonra çalıştırmak için şu sorguyu at.
exec dbo.İkiTarihArasıSiparisler '1996-07-04 00:00:00.000' , '1996-07-31 00:00:00.000'

--Ulkelere gore siparisleri getirmek için bu soruyu yazıp procedure olarak ekledik
Create procedure dbo.UlkeSiparisleri @ulke nvarchar(15)

As
Begin 

	Select * from Orders where ShipCountry = @ulke
End

--Kaydettikten sonra çalıştırmak için şu sorguyu at.
Exec dbo.UlkeSiparisleri 'USA'   --dbo. yazmadan da çalıştırabilirsin.


-- Customer tablosunda şehirin listesini getiren bir procedur yazalım.
Create procedure dbo.CustomerSehirler
@sehir nvarchar(20)
As
Begin
	Select * from Customers where City = @sehir

End

--Sorgudada adını verdiğim şehiri listelesin
exec dbo.CustomerSehirler 'London'


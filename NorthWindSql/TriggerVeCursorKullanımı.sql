
Create TRIGGER dbo.KullaniciMenuleriEkle
   ON  Kullanicilar
   AFTER Insert
AS 
BEGIN
	declare @KullaniciId int ,@menuId int
    select @KullaniciId = i.Id from inserted i
	-- Cursor tanimlamasinin yapildigi yer
   declare menucursor cursor for 
   select Id from Menuler where isActive =1
  --Cursor acildigi yer
   open menucursor
   fetch next from menucursor into @menuId
   --Dongu ile donuyoruz
   while @@FETCH_STATUS =0
   Begin
		insert into KullaniciMenuleri (KullaniciId,MenüId,isActive) values (@KullaniciId,@menuId,1)
	 fetch next from menucursor into @menuId
   end
   --Cursor'i kapatiyoruz
   close menucursor
   -- Memoriden ucuruyoruz
   deallocate menucursor
END
GO

--BUNUN İÇİN  CİNEMA KISMINDA  3 TABLO EKLEDİK 
-- Bir Kullanıcı eklendiğinde KullanıcıMenülerinde O kullanıcıya tüm menülerin atamasını otomatik yapsın. Bunun için aşağıdaki gibi Trigger yazdık.
-- Kullanıcıyı ve Menüyü tek tabloya kendi yazdı

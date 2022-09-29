CREATE TRIGGER dbo.UpdateProduct
   ON  [Order Details]

   AFTER INSERT
AS 
BEGIN

    -- Insert statements for trigger here
	-- Insert sırasında gelecek olan değerleri karşılayacak değişkenlerim
	Declare @ProductId int , @Adet smallint 

	-- Tanımladığım değişkenlerimi insert sırasındaki değerler ile dolduruyorum.
	select @ProductId = i.ProductID, @Adet=i.Quantity  from inserted i

	--  Insert sırasında gele product'ı update ediyorum
	Update Products set UnitsOnOrder = UnitsOnOrder + @Adet Where ProductID = @ProductId


END
GO

-- DELETED İŞLEMİ İÇİNDE AŞAĞIDAKİ KISMI YAZDIk

CREATE TRIGGER dbo.UpdateProductForDelete
   ON  [Order Details]

   AFTER DELETE
AS 
BEGIN

    -- Insert statements for trigger here
	-- Insert sırasında gelecek olan değerleri karşılayacak değişkenlerim
	Declare @ProductId int , @Adet smallint 

	-- Tanımladığım değişkenlerimi insert sırasındaki değerler ile dolduruyorum.
	select @ProductId = d.ProductID, @Adet=d.Quantity  from deleted d

	-- Insert sırasında gele product'ı update ediyorum
	Update Products set UnitsOnOrder = UnitsOnOrder - @Adet Where ProductID = @ProductId


END
GO

--UPDATE İŞLEMİ İÇİNDE AŞAĞIDAKİ KISMI YAZDIK

CREATE TRIGGER dbo.UpdateProductForupdate
   ON  [Order Details]

   AFTER UPDATE
AS 
BEGIN
    -- Insert statements for trigger here
	-- Insert sırasında gelecek olan değerleri karşılayacak değişkenlerim
	Declare @ProductId int , @EskiAdet smallint , @YeniAdet smallint
	Declare @Fark smallint 
	SET @Fark = 0 
	
	-- Tanımladığım değişkenlerimi insert sırasındaki değerler ile dolduruyorum.
	-- Update için Eski kayıt deleted tablosunda olandır yeni gelen de inserttedir.
	select @ProductId = d.ProductID, @EskiAdet=d.Quantity  from deleted d
	Select @ProductId = i.ProductID, @YeniAdet=i.Quantity  from inserted i

	Set @Fark = @YeniAdet-@EskiAdet

	-- Update sırasında gelen product'ı update ediyorum
	Update Products set UnitsOnOrder = UnitsOnOrder + @Fark Where ProductID = @ProductId


END
GO

-- BİR KERE CREATE OLARAK OLUŞTURDUKTAN SONRA KODDA HER DEĞİŞİKLİK YAPMAK İSTEDİĞİMİZDE 'ALTER' İLE BAŞLAYACAĞIZ.
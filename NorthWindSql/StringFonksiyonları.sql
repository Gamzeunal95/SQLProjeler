Select 5-3 as Fark , 
       5+3 as Toplam,
       3*5 as Carpim,
       5/3 as Bolum
Select 'Bugün gunlerden Pazartesi'

Select ASCII ('A')  -- Ascii kodunu verir
Select char(65) -- Ascii kodunu denk gelen harfi verir
--Charindex kullanımı
-- aliyilmaz@gmail.com -> Burada @ işareti kaçıncı sıradadır.

Select CHARINDEX ('@', 'aliyilmaz@gmail.com')

--Değişken tanımlamalro Declare komutu ile 
--Değişken @ işareti ile başlamalıdır.
-- Değişken isminden sonra tipi belirtilmelidir.
declare @mail as varchar(50)
set @mail = 'aliyilmaz@gmail.com'
Select CHARINDEX ('@', @mail)  -- Parantez içindeki @mail ile mail adresini otomatik aldık.
Select Left (@mail, 3) ,    --soldan 3 harf
       RIGHT (@mail, 3) ,   -- sağdan 3 harf
       len(@mail) Uzunluk , -- Uzunluğu kaç harf olduğu
       LOWER ('ALİYİLMAZ@GMAİL.COM'),
       UPPER (@mail)

--2.Ornek

 declare @yazi varchar(50)
 select @yazi= '    uskudar   '
 select LTRIM(@yazi)
 Select RTRIM(@yazi)

--Replace
 Select replace ('Birbirbirilerine' , 'bir' , 'iki') -- Bir yerine iki yaz demiş olduk.

-- SubString : verilen ifade içerisinde başlangıç indexinden başlayarak, bitise kadar olan değeri verir.
 Select SUBSTRING ('aliyilmaz@gmail.com' , 11, 5) --11.katakterden başla 5 karakter al dedik
-- 11'den sonraki butun karakterleri almak için
 Select SUBSTRING ('aliyilmaz@gmail.com' , 11, len('aliyilmaz@gmail.com') -10)
 --@işaretinden sonrakini almak istersem 
 declare @str varchar(50)
 set @str = 'aliyilmaz@gmail.com'
 Select SUBSTRING (@str , 
        charindex ('@',@str),  --@işaretinin kaçıncı sırada olduğu öğrenilir
        len (@str) - (charindex ('@',@str)-1))  -- uzunluğunu verir charindex ve devamı da 1 eksiğini bulup sonucu bulur
                   
-- Reverse : Tersine Çevirir
select REVERSE ('ali veli')
--Space (x)
select 'ali'+ SPACE(3) + 'veli'
--Replicate : Tekrarlama
Select REPLICATE('ali',3)

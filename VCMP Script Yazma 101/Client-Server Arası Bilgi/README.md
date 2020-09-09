

> Bilmeyenler için sunucu yaparken araştırdığınız yerlerde client ve server gibi terimlerle karşılaşıcaksınız,
>  bunlardan client olanı oyuncunun bilgisayarında gerçekleşicek olanıdır, server ise sunucuda gerçekleşicek olaylardır
>  VCMP'de oyuncunun ekranında birşeyler çıkarmak için Client Side Scripting( Client tarafında scriptleme ) yapmamız gerekiyor,
>  fakat dikkatli olmanız gerek client side girdiğiniz kodların oyuncunun bilgisayarında performans düşüklüğüne neden olabilir!
>  ( bu iki terim(client/server) heryerde geçer websocket rcon vs. )


İlk Soru vcmp'de client side nerde?  öğrenelim ' Sunucunuzun olduğu klasörün içinde > store > script > main.nut adlı dosya bizim client script dosyamız      
                                               ( eğer yoksa kendiniz oluşturabilirsiniz main.nut )
            
  İkinci olarak Tarayıcınızdan( Chrome/Opera/Firefox felan ) http://wiki.thijn.ovh/index.php?title=Scripting/Squirrel/Client_Functions adresini açık bırakın çünkü,
fonksiyonları öğreniceğimiz yer burası olucak ( wikide client scriptleme ile alakalı pek örnek yok o yüzden sadece fonksiyonların isimlerini öğrenmemiz yeter )
            
Üçüncü olarak hata yakalama scriptimizi client tarafına koyalım ---> https://forum.vc-mp.org/?topic=2765.0# <--- burdan sadece en üstteki kodu kopyalayın ve
                                                                    main.nut'ınızın en üst kısmına yapıştırın   

Artık kod yazdığımızda hata varsa gözüktüğüne göre yazmaya nerdeyse hazırız

Ön hazırlığın son aşaması main.nut dosyanızın içinde en sonda SendDataToServer adlı bir fonksiyon olmalı onu biraz kısaltalım ne dersiniz ilk olarak o fonksiyonu silin ve bunu yapıştırın

```squirrel
function SendDataToServer(str, int)
{
 local message = Stream();
 message.WriteInt(int.tointeger());
 message.WriteString(str);
 Server.SendData(message);
}
```
# Server Side ( Sunucunuzun olduğu klasörün içinden > scripts > main.nut (script dosyanız))

```squirrel
function SendDataToClient(player, integer, string)
{
 Stream.StartWrite();
 Stream.WriteInt(integer);
 if (string != null) Stream.WriteString(string);
 Stream.SendStream(player);
}
```
   ### Hazırlık bitti
        


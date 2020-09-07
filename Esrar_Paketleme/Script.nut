class jober
{
	procc = false; // İşlem sürecinde olup olmadığı (paketleme sırasında çalışır)
	drug = 0; // esrar sayısı   
	package = 0; // paket sayısı
	d_p_state = "true";
	j1_p_state = "true"; // Yapıcağınız diğer işler için
	j2_p_state = "true"; // Yapıcağınız diğer işler için
	j3_p_state = "true"; // Yapıcağınız diğer işler için
    // Neden bu kadar local olduğunu sormanız normal 
    // Normalde bu kadar local kullanmak iyi bişi değil ama ben bundan başka bi yöntem düşünemedim eğer siz biliyosanız ne mutlu size :D
	d1_state = 0;
	d2_state = 0;
	d3_state = 0;
	d4_state = 0;
	d5_state = 0;
	d6_state = 0;
	d7_state = 0;
	d8_state = 0;
	d9_state = 0;
	d10_state = 0;
}

function onScriptLoad()
{
    	    randcash <- [ 51, 62, 41, 30, 70];
	job <- array(GetMaxPlayers(),null);
    CreateCheckpoint(null, 1, true, Vector(-705.219,-1577.29, 15.9005), RGB(0, 0, 200), 3);
		CreateCheckpoint(null, 1, true, Vector(-624.839,622.171, 11.6949), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-1114.44,62.8966, 11.1668), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-983.664,47.8726, 10.5816), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-963.773,-204.006, 11.0245), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-930.022,-477.302, 10.9455), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-863.882,-1008.1, 12.5938), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-870.69,690.067, 11.0846), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-759.564,1210.18, 11.0712), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-647.94,904.948, 11.0846), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-794.299,357.751, 11.263), RGB(0, 0, 200), 2);
		CreateCheckpoint(null, 1, true, Vector(-1073.18,-283.448, 12.0882), RGB(0, 0, 200), 2);
    canenter <- array(GetMaxPlayers(),false);
    teleport <- array(GetMaxPlayers(),0);
    ENTER <- BindKey(true, 0xA1, 0, 0); // Bu kodları bulmak için Windows Vritual Keys yazıp google'da aratabilirsin
}

function onPlayerJoin( player )
{
    	job[ player.ID ] = jober();  // Tanımlıyoruz
} 


// checkpoint fonksiyonlarını ben yazmadım //
function onCheckpointEntered(player, checkpoint)
{
Announce("~t~LSHIFT ~b~Bas", player, 0);
canenter[player.ID]=true; // Checkpointe girebilmesini kontrol eden değer
teleport[player.ID]=checkpoint.ID; // checkpoint'in id'sini çekebilmek için "teleport[player.ID]"ye eşitliyoruz artık 
                                  // "teleport[player.ID]" kullanarak checkpointin id'sini alabilicez
Message(checkpoint.ID+""); // Bu sadece girdiğin checkpointin id'sini görebilmem için ekledim silebilirsiniz
}
function onCheckpointExited( player, checkpoint )
{
    Announce("", player, 0);
    canenter[player.ID]=false; // Checkpointe girebilmesini kontrol eden değer
    teleport[player.ID]=checkpoint.ID;// checkpoint'in id'sini çekebilmek için "teleport[player.ID]"ye eşitliyoruz artık 
                                        // "teleport[player.ID]" kullanarak checkpointin id'sini alabilicez
	job[ player.ID ].procc = false;	// Adamın işi yaparken eğer checkpointten çıkarsa işlemi durdurması için
}


function onKeyDown( player, key )
{
    if (key == ENTER) 
    {
        if (canenter[player.ID] == true)  // ilk adamın alanda olduğunu doğruluyoruz
        {
            // altta oyuncunun girdiği checkpointin id'lerinine göre ne yapıcaklarını söylüyoruz
            // teleport[player.ID] checkpoint fonksiyonlarından geliyor id'ler
            switch(teleport[player.ID])
            {
	case 1:
	Message(""+job[ player.ID ].d_p_state);
	Message(""+status[ player.ID ].job);
	if ( job[ player.ID ].d_p_state == "true" )
	{
	if( status[ player.ID ].job == false )
	{
		CreateMarker(player.UniqueWorld, Vector(-1073.18,-283.448, 12.0882), 3, RGB(0, 255, 255), 0) // Mapte oyunun kendisine ait dünyasına işaret koyduk
		job[ player.ID ].package += 10; // Paketleri verdik
		status[ player.ID ].job = true; // oyuncunun iş durumunu true yapıyoruz
		job[ player.ID ].d_p_state = "gorevde"; // bu oyununcunun oyundan çıkması durumunda çalışan bişi fakat SQL kodlarını buraya girmedim
                                                // O yüzden sizin yazmanız gerek SQL kodlarını alta bi örnek bırakırım
		Message("Basladin")
		player.Skin = 114; // oyuncunun skin değişti
	}
	else if( status[ player.ID ].job == true ) // İşe başladıysa job değeri true oluyor, burdada eğer job değeri true ise bunu çalıştırıyor
	{
		if( job[ player.ID ].package == 0 && job[ player.ID ].drug == 0 ) // Doğrulama için hem esrar hemde paketlerin sayısı 0 olduğunu kontrol ediyor
		{                                                                 // Çünkü işlemler bittiğinde oyuncuda 0 tane esrar ve paket olmalı
		player.Skin = 0; // adamın skinini 0 yapar (tomy)
		NewTimer("re_d_miss", 900000, 1, player.ID); // 15 dakkalık bi cooldown
		job[ player.ID ].d_p_state = "true"; // adamın görevi btirdiğini söylemek için d_p_state değerini true(TEXT) yapıyoruz
		MessagePlayer("Hadi uzaklas burdan devam et...",player);
		} else return Message("Devam Et"); //adamın esrar ve paketi 0'a eşit değilse çalışır
	}
	}else return 
	break;
	

    // case 2'den case 11'e kadar sürekli aynı kodlar dönüyor fakat değerleri farklı 2-11 arası oyuncunun esrarları bırakığı zaman çalışıcağı kodlar
	case 2:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d1_state > 0 ) // bakıyoruz adam önceden bunu kullanmış mı, kullandıysa bunu dicek
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)  // esrar sayısını kontrol ediyoruz 0'dan büyükse çalışır
		{
		job[ player.ID ].d1_state += 1; // Oyuncunun bu checkpointi bidaha kullanamaması için
		FindCheckpoint(2).World = 100; // Checkpointi 100. dünyaya atar ( Oyunda paralelevren gibi bişi var wiki'den bakabilirsiniz )
        DestroyMarker(d1); // Mapteki işareti kaldırır
		job[ player.ID ].drug -= 1; // Esrar eksiltiyor çünkü adama verdi
		 local a = randcash[rand()% randcash.len()] // Rastgele para gelmesi için yazıldı "a" array'inde yazan sayılardan birisini seçip o kadar para verir
		IncCash( player, a) // Bu fonksiyonu ben yaazmadım fakat bunu kullanın oyuncuya para ekliyor burda
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}//Diğerlerindede aynı gidiyor yazmıcam bidaha
	break;
	case 3:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d2_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d2_state += 1;
        DestroyMarker(d2);
		FindCheckpoint(3).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 4:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d3_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d3_state += 1;
        DestroyMarker(d3);
		FindCheckpoint(4).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 5:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d4_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d4_state += 1;
        DestroyMarker(d4);
		FindCheckpoint(5).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 6:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d5_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d5_state += 1;
        DestroyMarker(d5);
		FindCheckpoint(6).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 7:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d6_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d6_state += 1;
        DestroyMarker(d6);
		FindCheckpoint(7).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 8:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d7_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d7_state += 1;
        DestroyMarker(d7);
		FindCheckpoint(8).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 9:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d8_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d8_state += 1;
        DestroyMarker(d8);
		FindCheckpoint(9).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 10:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d9_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		else if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d9_state += 1;
		FindCheckpoint(10).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
        DestroyMarker(d9);
		job[ player.ID ].drug -= 1;
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
		case 11:
	if( status[ player.ID ].job == true )
	{
		if( job[ player.ID ].d10_state > 0 )
		{
			return MessagePlayer("Buna zaten maldan vermissin", player);
		}
		if ( job[ player.ID ].drug > 0)
		{
		job[ player.ID ].d10_state += 1;
		FindCheckpoint(11).World = 100;
		local a = randcash[rand()% randcash.len()]
		IncCash( player, a)
        DestroyMarker(d10);
		job[ player.ID ].drug -= 1;
		if( job[ player.ID ].drug == 0)
		{
			MessagePlayer("Gorevi aldigin yere geri don dikkat et yakalanma", player);
		}
		MessagePlayer("Dikkat cekmeden devam et",player)
		}
	}
	break;
	case 12:
		job[ player.ID ].procc = true; // işlem değerini true atıyoruz
		if( job[ player.ID ].package > 0 && job[ player.ID ].drug < 10 ) // kontrol ediyoruz adamın esrar ve paket sayılarını
		{
		druggger <- NewTimer("druger", 2500, 0, player.ID) /// eğer sayılar uygunsa druger'ı çalıştırıyor
		}else { MessagePlayer("Mallari alip gel", player); 	} // uygun değilse çalıştırmıyor bunu diyor
	break;
}
        }
    }
}


function re_d_miss(players) // Bu oyuncunun bidaha görevi yapabilmesi için, işi bitirdikten sonra 15 dakka sonra çalışıyo ve görevi hazır hale getiriyo
{
		local player = FindPlayer(players) // adamı buluyoruz
	if ( job[ player.ID].d_p_state != "gorevde") // adam oyundan çıkmışmı diye bakıyoruz (SQL gerekir)
	{
	job[ player.ID ].d_p_state = "true"; // durumu true yaptık
	MessagePlayer("Esrarci adam haber verdi...",player);
	}else { // eğer d_p_state, gorevde'ye eşitse
		NewTimer("re_d_q_miss", 1000, 1, player.ID) 
	}
}
function re_d_q_miss(players) // Adam oyundan çıktıysa ceza (SQL gerektirir)
{
	local player = FindPlayer(players)
	job[ player.ID ].d_p_state = "true";
	DecCash(player, 500);
	MessagePlayer("Esrarci adam haber verdi yine adami satma...",player);
}

function druger(player)
{
		local plr = FindPlayer(player)
		if ( job[ plr.ID ].procc == true)
		{
	if ( job[ plr.ID ].drug == 10 ) // eğer esrar sayısı 10'a eşitse çalışıcak
	{
		druggger.Delete(); // Timer'ı kapatmak için
		MessagePlayer("Gidip teslim et",plr)
		job[ plr.ID ].procc = false;	// bu değer sistemi geliştirmek için koymuştum (öylesine) pek bi anlamı yok sadece
		d1<- CreateMarker(plr.UniqueWorld, Vector(-624.839,622.171, 11.6949), 2, RGB(153, 51, 255), 0);
		d2<-CreateMarker(plr.UniqueWorld, Vector(-1114.44,62.8966, 11.1668), 2, RGB(153, 51, 255), 0);
		d3<-CreateMarker(plr.UniqueWorld, Vector(-983.664,47.8726, 10.5816), 2, RGB(153, 51, 255), 0);
		d4<-CreateMarker(plr.UniqueWorld, Vector(-963.773,-204.006, 11.0245), 2, RGB(153, 51, 255), 0);
		d5<-CreateMarker(plr.UniqueWorld, Vector(-930.022,-477.302, 10.9455), 2, RGB(153, 51, 255), 0);
		d6<-CreateMarker(plr.UniqueWorld, Vector(-863.882,-1008.1, 12.5938), 2, RGB(153, 51, 255), 0);
		d7<-CreateMarker(plr.UniqueWorld, Vector(-870.69,690.067, 11.0846), 2, RGB(153, 51, 255), 0);
		d8<-CreateMarker(plr.UniqueWorld, Vector(-759.564,1210.18, 11.0712), 2, RGB(153, 51, 255), 0);
		d9<-CreateMarker(plr.UniqueWorld, Vector(-647.94,904.948, 11.0846), 2, RGB(153, 51, 255), 0);
		d10<-CreateMarker(plr.UniqueWorld, Vector(-794.299,357.751, 11.263), 2, RGB(153, 51, 255), 0);			
			MessagePlayer(	job[ plr.ID ].package+" drug,"+job[ plr.ID ].drug,plr) // Bu mesaj sadece bilgilendirmek için
	}
	else if ( job[ plr.ID ].package < 10 ) // eğer 10'dan azsa bunu çalıştırıcak
	{
	job[ plr.ID ].package -= 1; // 1 paket silip
	job[ plr.ID ].drug += 1; // 1 esrar ekliyor
	MessagePlayer("Esrar paketlendi.", plr); 
	MessagePlayer(	job[ plr.ID ].package+" drug,"+job[ plr.ID ].drug,plr) 
	}
		}
}
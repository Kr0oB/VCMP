/*
Vice City Multiplayer 0.4 Blank Server (by Seby) for 64bit Windows.
You can use it to script your own server. Here you can find all events developed.

VC:MP Official: www.vc-mp.org
Forum: forum.vc-mp.org
Wiki: wiki.vc-mp.org

Bu dosyanın asıl hali [->](https://forum.vc-mp.org/?topic=33.0)
------------------------------------------------------------------

Şuan bu dosyanın bulunduğu yere server-side denir yani buraya koyduğunuz scriptler sunucu tarafından çalıştırılcak buda burda çalışan scriptlerin yükü sunucuda olucak demek, ne kadar çok script koyarsanız o kadarda sunucuyu yorarsınız (illa çok olmasına gerek yok tek ağır scriptde yorabilir scripte göre değişir)


*/


// =========================================== Sunucu Etkinlikleri ==============================================
// Burdan sonrası sunucuda oluşan etkinlikler/olaylar kontrol eden fonksiyonlar var
// Bu fonksiyonlar bizim sunucudaki sinir ağımız gibi düşünebilirsiniz
// Fonksiyonların içinde ne işe yaradıkları açıklandı


function onServerStart()
{
	// server64.exe'yi açtığınız an bu fonksiyon çalışır
	// Genelde kullanılmaz
}

function onServerStop()
{
	// server64.exe'yi kapattığınız an bu fonksiyon çalışır
	// Genelde kullanılmaz
}


function onScriptLoad()
{	
	// Sunucu scripti yüklendiğinde çalışır
}

function onScriptUnload()
{
	// Eğer scripti kapatıcak bi kodunuz yoksa burası sadece sunucu kapanırken çalışır
	// Genelde burayı Database'lerle bağlantı koparmak için kullanılır (datalar gitmesin diye)
}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player )
{
	// Bir oyuncu sunucuya girince çalışır
}

function onPlayerPart( player, reason )
{
	// Bir oyuncu sunucudan ayrılınca çalışır
}

function onPlayerRequestClass( player, classID, team, skin )
{
	// Bir oyuncu karakter seçme ekranında, her karakter değiştirdiğinde çalışır. (karakter isteği)

}

function onPlayerRequestSpawn( player )
{
	// Bir oyuncu doğmak istediği zaman çalışır
	// Oyuncu doğmadan hemen önce bişi yapıcaksanız burda yapın
}

function onPlayerSpawn( player )
{
	 // Bir oyuncu doğduğunda çalışır
}

function onPlayerDeath( player, reason )
{
	// Bir oyuncu öldüğünde çalışır
}

function onPlayerKill( player, killer, reason, bodypart )
{
	// Bir oyuncu, başka bir oyuncuyu öldürdüğünde çalışır
}

function onPlayerTeamKill( player, killer, reason, bodypart )
{
	// Bir oyuncu kendi takımındaki birisini öldürünce çalışır
}

function onPlayerChat( player, text )
{
	print( player.Name + ": " + text );
	// Bir oyuncu chate bir mesaj gönderdiğinde çalışır
	return 1;
}

function onPlayerCommand( player, cmd, text )
{
// Bir oyuncu chate / ile başlayan bir şey yazarsa bu fonksiyon çalışır
// Sunucudaki komutlar burada çalıştırılır
}

function onPlayerPM( player, playerTo, message )
{
	// Bir oyuncu, başka bir oyuncuya özel mesaj atarsa burası çalışır
	return 1;
}

function onPlayerBeginTyping( player )
{
	// Oyuncu chate bir şey yazarken çalışır (yazmaya devam ettiği süre devam eder çalışması) 
}

function onPlayerEndTyping( player )
{
	// Oyuncu yazmasını bitirdiğinde yada yazmayı bıraktığı zaman çalışır
}


function onLoginAttempt( player )
{
	// Oyuncu giriş yapmaya çalışırsa çalışır // ben daha kullananı görmedim, büyük ihtimal kaldırılıcak bir fonksiyondu fakat unutuldu
}


function onNameChangeable( player )
{
	// bu fonksiyon onLoginAttempt gibi unutulan bir fonksiyon //  kullanılmıyor
}

function onPlayerSpectate( player, target )
{
	// Oyuncu, başka bir oyuncuyu izlemeye başladığı an çalışır
}

function onPlayerCrashDump( player, crash )
{
	// Oyuncunun oyunu crash verirse çalışır
}

function onPlayerMove( player, lastX, lastY, lastZ, newX, newY, newZ )
{
	// Oyuncu hareket etmeye başlarsa çalışır ( hareket ettiği sürede devam eder )
}

function onPlayerHealthChange( player, lastHP, newHP )
{
	// Oyuncunun can değeri değiştiğinde çalışır ( canı azaldığında/arttığında )
}

function onPlayerArmourChange( player, lastArmour, newArmour )
{
	// Oyuncunun zırh değeri değiştiğinde çalışır ( canı azaldığında/arttığında )
}

function onPlayerWeaponChange( player, oldWep, newWep )
{
	// Oyuncu her silah değiştirdiğinde çalışır
}

function onPlayerAwayChange( player, status )
{
	// Oyuncunun durumu değiştikçe çalışır (afk olup olmadığı)
}

function onPlayerNameChange( player, oldName, newName )
{
	// Oyuncunun nicki değişince çalışır
}

function onPlayerActionChange( player, oldAction, newAction )
{
	// Oyuncunun yaptığı hareketler değiştikçe çalışır (ateş ediyor/yürüyor/duruyor.. vb.)
}


function onPlayerOnFireChange( player, IsOnFireNow )
{
	// Oyuncu yanıyosa çalışır (molotof/alevsilahı gibi silahlardan etkilenirse)
}

function onPlayerCrouchChange( player, IsCrouchingNow )
{
	// Oyuncu eğilirse çalışır
}

function onPlayerGameKeysChange( player, oldKeys, newKeys )
{
	// Oyun tuşları değişirse çalışır
}


function onClientScriptData( player )
{
	// Cliend-Side = Oyuncunun bilgisayarıdna çalışan scriptlerin bulunduğu yer (store>scripts>...)
	// Client-Side'dan gelen bilgi olursa burası çalışır (ilerde daha iyi anlıcaksınız)
}

// ========================================== V E H I C L E   E V E N T S =============================================

function onPlayerEnteringVehicle( player, vehicle, door )
{
	// Oyuncu bir araca binmeye başladığı zaman çalışır (oyuncu araca binmeden önce çalışır)
}

function onPlayerEnterVehicle( player, vehicle, door )
{
	// Oyuncu araca bindii zaman çalışır
}

function onPlayerExitVehicle( player, vehicle )
{
	// Oyuncu araçtan indiği zaman çalışır
}

function onVehicleExplode( vehicle )
{
	// (Herhangi bir) araç patladığı zaman çalışır
}

function onVehicleRespawn( vehicle )
{
	// (Herhangi bir) araç yeniden çıktığı(doğduğu) zaman çalışır
}

function onVehicleHealthChange( vehicle, oldHP, newHP )
{
	// (Herhangi bir) aracın can değeri değiştiğinde çalışır (azaldığında/arttığında)
}

function onVehicleMove( vehicle, lastX, lastY, lastZ, newX, newY, newZ )
{
	// (Herhangi bir) araç hareket ettiği zaman çalışır (hareket ettiği sürece çalışır)
}

// =========================================== P I C K U P   E V E N T S ==============================================

function onPickupPickedUp( player, pickup )
{
	// Oyuncu Alınabilir-Obje'nin içinden geçtiği zaman
	// Alınabilir-Obje = Normal oyuncu insanları öldürdüğünüz zaman yerde duran para/silah gibi şeylere denir
}

function onPickupRespawn( pickup )
{
	// (Herhangi bir) alınabilir-obje yeniden çıktığında(doğduğunda) çalışır
}

// ========================================== O B J E C T   E V E N T S ==============================================

function onObjectShot( object, player, weapon )
{
	// Oyuncu bir objeye ateş attığında çalışır ( ateş edilen objenin custom yani oyuncunun kendisinin eklemiş olması gerekir )
	// Normal oyunda olan binalara ateş ettiğiniz zaman bu fonksiyon çalışmaz
}

function onObjectBump( object, player )
{
	// Oyuncu bir objeye çarptığında çalışır ( çarpılan objenin custom yani oyuncunun kendisinin eklemiş olması gerekir)
	// Normal oyunda olan binalara çarptığınız zaman bu fonksiyon çalışmaz
}

// ====================================== C H E C K P O I N T   E V E N T S ==========================================

function onCheckpointEntered( player, checkpoint )
{
	// Oyuncu Kontrol Noktasına girdiği zaman çalışır
	// Kontrol Noktası =  Oyunda görevlerin olduğu yerlerde bulunan renkli daireler
}

function onCheckpointExited( player, checkpoint )
{
	// Oyuncu Kontrol Noktasından çıktığı zaman çalışır
}

// =========================================== B I N D   E V E N T S =================================================

function onKeyDown( player, key )
{
	// Oyuncu belirtilen tuşa bastığında çalışır
}

function onKeyUp( player, key )
{
	// Oyuncu belirtilen tuşdan parmağını çektiği zaman çalışır
}

// ================================== T I M E E V E N T ======================================
function onTimeChange( lastHour, lastMinute, hour, minute )
{
	// Sunucuda bulunan zaman değiştikçe burası çalışır ( dakika/saat olarak fakat biraz uğraşırsanız saniyeyide kullanabilirsiniz )
}

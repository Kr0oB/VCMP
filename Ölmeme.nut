class Playerstatus
{
 Died = false;
 d_X = null;
 d_Y = null;
 d_Z = null;
 DeadFor = null;
}


function onScriptLoad()
{
	status <- array(GetMaxPlayers(), null)
	// SQL bilgileri siz kendinize göre yaparsınız
        DB <- ConnectSQL("Databases/Hesap.db");
        QuerySQL(DB, "create table if not exists Other ( Name TEXT, Died BOOLEAN DEFAULT false, DX FLOAT, DY FLOAT, DZ FLOAT) ");
}

function onPlayerJoin( player )
{
status[player.ID] = Playerstatus();
}

function aciloff(player)
{
    player = FindPlayer( player );
    DestroyMarker( acils );
    acilarr[player.ID] = false;
}

function DeadInfo(player)
{
 local z = QuerySQL(DB, "SELECT * FROM Other WHERE Name = '" + escapeSQLString(player.Name) + "'");
 if (q)
 {
  status[player.ID].Died = GetSQLColumnData(z, 7);
  status[player.ID].d_X = GetSQLColumnData(z, 8);
  status[player.ID].d_Y = GetSQLColumnData(z, 9);
  status[player.ID].d_Z = GetSQLColumnData(z, 10);
 }
}
function onPlayerDeath( player, reason )
{
        player.Health = 1;
        status[player.ID].d_X = player.Pos.x;
        status[player.ID].d_Y = player.Pos.y;
        status[player.ID].d_Z = player.Pos.z;    
        status[player.ID].Died = true;

if ( status[player.ID].Died == true)
{
                //Yardım Çağrısı

 local acilci;
 for( local i = 0; i <= GetMaxPlayers(); i++ )
 {
 acilci = FindPlayer( i );
 if ( (acilci) && ( acilci.Skin == 1 ) )
 {
         Message("[#1b8bb4][ACIL] [#FFFFFF]" + player.Name + " [#1b8bb4] saglikci cagirdi. [#1b8bb4] Bolge:[#FFFFFF] " +GetDistrictName(player.Pos.x, player.Pos.y)+"")
          MessagePlayer("[#1b8bb4][ACIL] [#FFFFFF]Bulundugun konuma saglikci cagirdin. [#1b8bb4] Bolge:[#FFFFFF] " +GetDistrictName(player.Pos.x, player.Pos.y)+"",player)   
     acils <- CreateMarker(1, Vector(player.Pos.x, player.Pos.y, player.Pos.z), 1, RGB(0, 255, 0), 22)
    NewTimer("aciloff", 30000, 1, player.ID);
    acilarr[player.ID] = true;
 }
    }
        player.SetAnim(0,126);
        player.IsFrozen = true;
    }
}

function onPlayerKill( killer, player, reason, bodypart )
{
    player.Health = 1;
    status[player.ID].Died = true;
    if ( status[player.ID].Died == true)
    {
            //Yardım Çağrısı
		local acilci;
		for( local i = 0; i <= GetMaxPlayers(); i++ )
		{
			acilci = FindPlayer( i );
			if ( (acilci) && ( acilci.Skin == 1 ) )
			{
				Message("[#1b8bb4][ACIL] [#FFFFFF]" + player.Name + " [#1b8bb4] saglikci cagirdi. [#1b8bb4] Bolge:[#FFFFFF] " +GetDistrictName(player.Pos.x, player.Pos.y)+"")
				MessagePlayer("[#1b8bb4][ACIL] [#FFFFFF]Bulundugun konuma saglikci cagirdin. [#1b8bb4] Bolge:[#FFFFFF] " +GetDistrictName(player.Pos.x, player.Pos.y)+"",player)   
				acils <- CreateMarker(1, Vector(player.Pos.x, player.Pos.y, player.Pos.z), 1, RGB(0, 255, 0), 22)
				NewTimer("aciloff", 30000, 1, player.ID);
				acilarr[player.ID] = true;
			}
		}
        player.SetAnim(0,126);
        player.IsFrozen = true;
    }
}

function onTimeChange(oldHour, oldMin, newHour, newMin)
{
	for (local i = 0; i < GetMaxPlayers(); ++i)
	{
		local player = FindPlayer(i);

		if (player)
		{
			if (player.IsSpawned)
			{
            if ( status[player.ID].Died == true)
            {
                if (status[player.ID].DeadFor == null)
                {
                        local Val = 1;
                        local DeadJail = Val * 10000, DeadJail2 = Val * 10;
                        status[player.ID].DeadFor = DeadJail2;
                        Message(status[player.ID].DeadFor+" saniye sonra oto dogcak");
                }else {

                    	local Time = status[player.ID].DeadFor,
						mins = (Time % 3600) / 60,
						secs = Time % 60;
						Stream.StartWrite();
						Stream.WriteInt(36);
						Stream.WriteString(mins + ":" + secs);
						Stream.SendStream(player);
						status[player.ID].DeadFor--;
                }
				if ( status[player.ID].DeadFor < 1)
				{
					if( Hospi[player.ID] == 1 )
						{
							GetNearestHospital(player);
							player.World = 1;
                           				 // En yakın Hastane Scripti entegresi adamın süresi dolunca en yakın hastaneye gider
							if (Hospital_Spawn[player.ID] == true) { player.Pos = Hospital_Locator[player.ID]; Hospital_Spawn[player.ID] = false; }
							Hospi[player.ID] = 0;
							MessagePlayer( "[#e74c3c][ACIL] [#FFFFFF]Butun doktorlar izinde amk bu nasi is bole neyse seni en yakin hastaneye ulastirdik son anda hadi yine iyisin.", player );
							Stream.StartWrite();
							Stream.WriteInt(37);
							Stream.SendStream(player);
							status[player.ID].DeadFor = null;
							status[player.ID].Died = false;
							player.IsFrozen = false;
							player.SetAnim(0,172);
						}					
				    }
                }
            }
        }
    }
}
function onPlayerSpawn( player )
{
    if ( status[player.ID].Died == true)
    {
			Hospi[player.ID] = 1;
        player.SetAnim(0,126);
        player.IsFrozen = true;
        player.Pos = Vector(status[player.ID].d_X,status[player.ID].d_Y,status[player.ID].d_Z);
        // girip çıkma yada adam patladığında mesela direk spawn ekranına gitmesi durumunda kordinatları kaydedip öldüğü yerde doğurma
        //Yardım Çağrısı
local acilci;
 for( local i = 0; i <= GetMaxPlayers(); i++ )
 {
 acilci = FindPlayer( i );
 if ( (acilci) && ( acilci.Skin == 1 ) )
 {
         Message("[#1b8bb4][ACIL] [#FFFFFF]" + player.Name + " [#1b8bb4] saglikci cagirdi. [#1b8bb4] Bolge:[#FFFFFF] " +GetDistrictName(player.Pos.x, player.Pos.y)+"")
          MessagePlayer("[#1b8bb4][ACIL] [#FFFFFF]Bulundugun konuma saglikci cagirdin. [#1b8bb4] Bolge:[#FFFFFF] " +GetDistrictName(player.Pos.x, player.Pos.y)+"",player)   
     acils <- CreateMarker(1, Vector(player.Pos.x, player.Pos.y, player.Pos.z), 1, RGB(0, 255, 0), 22)
    NewTimer("aciloff", 30000, 1, player.ID);
    acilarr[player.ID] = true;
 }
    }
    }
}

function kaldir( player )
{
                //Doktorlar için kaldırma

 player = FindPlayer( player );
 if( player )
 {
  player.IsFrozen = false;
  player.SetAnim(0,161);
status[player.ID].Died = "false";
  MessagePlayer("[#ef5777]#[#0be881]VC[#d2dae2]-[#575fcf]TR[#ef5777]# [#828282]Tedavin bitti", player);
 }
Stream.StartWrite();
Stream.WriteInt(37);
Stream.SendStream(player);	
status[player.ID].DeadFor = null;	
}
function SaveAccount(player)
{
        QuerySQL(DB, "UPDATE Other SET Died = '" + status[player.ID].Died + "' WHERE Name = '" + player.Name + "'");
          QuerySQL(DB, "UPDATE Other SET DX = '" + status[player.ID].d_X + "' WHERE Name = '" + player.Name + "'");
          QuerySQL(DB, "UPDATE Other SET DY = '" + status[player.ID].d_Y + "' WHERE Name = '" + player.Name + "'");
          QuerySQL(DB, "UPDATE Other SET DZ = '" + status[player.ID].d_Z + "' WHERE Name = '" + player.Name + "'");
}


/// Client

	Dead <-
    {
    	Windows = null
    	Labels = null
        Time = null
    }

function Server::ServerData(stream)
{
 local StreamReadInt = stream.ReadInt(),
 StreamReadString = stream.ReadString();
 switch (StreamReadInt.tointeger())
 {
		case 36: local data = StreamReadString; DeadFors(data); break;
		case 37: Dead.Labels = null; break;
 }
 }

 	function DeadFors(data)
    {
    	local separator = split(data ":"), mins = separator[0], secs = separator[1];
		    Dead.Labels = GUILabel(VectorScreen(sX * 0.5, sY * 0.8), Colour(232, 232, 232), "", GUI_FLAG_TEXT_SHADOW | GUI_FFLAG_BOLD);
			Dead.Labels.FontSize = 15;
    		Dead.Labels.Text = "" + mins + " dakika " + secs + " saniye sonra dogucaksiniz";
    }	
	function DeadForN()
    {
		    Dead.Labels = null;
    }	

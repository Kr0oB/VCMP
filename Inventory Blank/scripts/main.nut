/*
Vice City Multiplayer 0.4 Blank Server (by Seby) for 64bit Windows.
You can use it to script your own server. Here you can find all events developed.

VC:MP Official: www.vc-mp.org
Forum: forum.vc-mp.org
Wiki: wiki.vc-mp.org
*/

// Edited by KrOoB_ for adding inventory system thanks for your support <3

        
// Creating a connection between client and server scripts
// I'm using bytes for identification, because they are the most waste-less for the designated task
// This must be the same in both, client-side and server-side.

class Inventory
{
Pizza = 0;
Hotdog = 0;
Cookie = 0;
Taco = 0;
Burger = 0;
Water = 0;
Wine = 0;
Weed = 0;
// You can add more item 
}
// =========================================== S E R V E R   E V E N T S ==============================================

/*
function onServerStart()
{
}

function onServerStop()
{
}
*/

function onScriptLoad()
{

	Inv <- ConnectSQL("Inventory.db");
 QuerySQL(Inv, "create table if not exists Inventory ( Name TEXT, Pizza NUMERIC, Hotdog NUMERIC, Burger NUMERIC, Cookie NUMERIC, Taco NUMERIC, Water NUMERIC, Wine NUMERIC, Weed NUMERIC ) ");
	inv <- array( GetMaxPlayers(), false);
	I_KEY <- BindKey(true, 0x49, 0, 0);
	Inventories <- array( GetMaxPlayers(), false);

}

function onScriptUnload()
{
}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player )
{
	    inv[ player.ID ] = Inventory();
		GetInventory(player);
}

function onPlayerPart( player, reason )
{
		if( inv[ player.ID ] == true) { inv[ player.ID ] = false; }
}

function onPlayerRequestClass( player, classID, team, skin )
{
	return 1;
}

function onPlayerRequestSpawn( player )
{
	return 1;
}

function onPlayerSpawn( player )
{
}

function onPlayerDeath( player, reason )
{
}

function onPlayerKill( player, killer, reason, bodypart )
{
}

function onPlayerTeamKill( player, killer, reason, bodypart )
{
}

function onPlayerChat( player, text )
{
	print( player.Name + ": " + text );
	return 1;
}

function onPlayerCommand( player, cmd, text )
{
	if(cmd == "heal")
	{
		local hp = player.Health;
		if(hp == 100) Message("[#FF3636]Error - [#8181FF]Use this command when you have less than 100% hp !");
		else {
			player.Health = 100.0;
			MessagePlayer( "[#FFFF81]---> You have been healed !", player );
		}
	}
	else if ( cmd == "cms")
	{ 
		MessagePlayer( "sa "+inv[ player.ID ].Pizza,player );
	}
	else if(cmd == "goto") {
		if(!text) MessagePlayer( "Error - Correct syntax - /goto <Name/ID>' !",player );
		else {
			local plr = FindPlayer(text);
			if(!plr) MessagePlayer( "Error - Unknown player !",player);
			else {
				player.Pos = plr.Pos;
				MessagePlayer( "[ /" + cmd + " ] " + player.Name + " was sent to " + plr.Name, player );
			}
		}
		
	}
	else if(cmd == "bring") {
		if(!text) MessagePlayer( "Error - Correct syntax - /bring <Name/ID>' !",player );
		else {
			local plr = FindPlayer(text);
			if(!plr) MessagePlayer( "Error - Unknown player !",player);
			else {
				plr.Pos = player.Pos;
				MessagePlayer( "[ /" + cmd + " ] " + plr.Name + " was sent to " + player.Name, player );
			}
		}
	}
    
	/*
	else if(cmd == "exec") 
	{
		if( !text ) MessagePlayer( "Error - Syntax: /exec <Squirrel code>", player);
		else
		{
			try
			{
				local script = compilestring( text );
				script();
			}
			catch(e) MessagePlayer( "Error: " + e, player);
		}
	}
    */
    
	return 1;
}

function onPlayerPM( player, playerTo, message )
{
	return 1;
}

function onPlayerBeginTyping( player )
{
}

function onPlayerEndTyping( player )
{
}

/*
function onLoginAttempt( player )
{
	return 1;
}
*/

function onNameChangeable( player )
{
}

function onPlayerSpectate( player, target )
{
}

function onPlayerCrashDump( player, crash )
{
}

function onPlayerMove( player, lastX, lastY, lastZ, newX, newY, newZ )
{
}

function onPlayerHealthChange( player, lastHP, newHP )
{
}

function onPlayerArmourChange( player, lastArmour, newArmour )
{
}

function onPlayerWeaponChange( player, oldWep, newWep )
{
}

function onPlayerAwayChange( player, status )
{
}

function onPlayerNameChange( player, oldName, newName )
{
}

function onPlayerActionChange( player, oldAction, newAction )
{
}

function onPlayerStateChange( player, oldState, newState )
{
}

function onPlayerOnFireChange( player, IsOnFireNow )
{
}

function onPlayerCrouchChange( player, IsCrouchingNow )
{
}

function onPlayerGameKeysChange( player, oldKeys, newKeys )
{
}

function onPlayerUpdate( player, update )
{
}

function non_drunk(player){
	         player.SetDrunkLevel( 0, 0 );
}

function onClientScriptData( player )
{
	local string = Stream.ReadString(), int = Stream.ReadInt();
	if (string == "Inventory.B_pizza" )
	{
		if ( inv[ player.ID ].Pizza == 0 ) MessagePlayer("[#ffffff]You dont have pizza",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You don't have to eat something for now",player)
		else
		{
		inv[ player.ID ].Pizza--;
		player.Health+=20;
		MessagePlayer("[#ffffff]You ate pizza",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}
	else if (string == "Inventory.B_hotdog" )
	{
		if ( inv[ player.ID ].Hotdog == 0 ) MessagePlayer("[#ffffff]You dont have hotdog",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You don't have to eat something for now",player)
		else
		{
		inv[ player.ID ].Hotdog--;
		player.Health+=15;
		MessagePlayer("[#ffffff]You ate hotdog",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}
	else if (string == "Inventory.B_water" )
	{
	    if ( inv[ player.ID ].Water == 0 ) MessagePlayer("[#ffffff]You dont have water",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You cant drink water for now ",player)
		else
		{
		inv[ player.ID ].Water--;
		player.Health+=15;
		MessagePlayer("[#ffffff]You drank water",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}
	else if (string == "Inventory.B_taco" )
	{
	    if ( inv[ player.ID ].Taco == 0 ) MessagePlayer("[#ffffff]You dont have Taco",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You don't have to eat something for now",player)
		else
		{
		inv[ player.ID ].Taco--;
		player.Health+=10;
		MessagePlayer("[#ffffff]You ate taco",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
	    }
	}
	else if (string == "Inventory.B_cookie" )
	{
		if ( inv[ player.ID ].Cookie == 0 ) MessagePlayer("[#ffffff]You dont have cookie",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You don't have to eat something for now",player)
		else
		{
		inv[ player.ID ].Cookie--;
		player.Health+=5;
		MessagePlayer("[#ffffff]You ate cookie",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}
	else if (string == "Inventory.B_hamburger" )
	{
		if ( inv[ player.ID ].Burger == 0 ) MessagePlayer("[#ffffff]You dont have Hamburger",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You don't have to eat something for now",player)
		else
		{
		inv[ player.ID ].Burger--;
		player.Health+=20;
		MessagePlayer("[#ffffff]You ate Hamburger",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}
	else if (string == "Inventory.B_weed" )
	{
     	if ( inv[ player.ID ].Weed == 0 ) MessagePlayer("[#ffffff]You dont have weed",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You don't need smoke for now",player)
		else
		{
		inv[ player.ID ].Weed--;
		player.Health+=5;
	 player.SetDrunkLevel( 100, 100 );
		 NewTimer("non_drunk", 5000, 1, player.ID);	
		MessagePlayer("[#ffffff]You have smoked a weed",player)
		PlaySound(player.World, 50003, player.Pos);
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}

	else if (string == "Inventory.B_wine" )
	{
	    if ( inv[ player.ID ].Wine == 0 ) MessagePlayer("[#ffffff]You dont have wine",player)
		else if( player.Health > 100 ) MessagePlayer("[#ffffff]You cant drink wine for now",player)
		else
		{
		inv[ player.ID ].Wine--;
		player.Health+=12;
		player.SetDrunkLevel( 50, 50 );
		NewTimer("non_drunk", 5000, 1, player.ID);
		MessagePlayer("[#ffffff]You drank wine",player)
		local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
		local data = Stream();
		data.StartWrite(  );
		data.WriteInt(26);
		data.WriteString( DataforClient );
		data.SendStream( player );
		}
	}
}

// ========================================== V E H I C L E   E V E N T S =============================================

function onPlayerEnteringVehicle( player, vehicle, door )
{
	return 1;
}

function onPlayerEnterVehicle( player, vehicle, door )
{
}

function onPlayerExitVehicle( player, vehicle )
{
}

function onVehicleExplode( vehicle )
{
}

function onVehicleRespawn( vehicle )
{
}

function onVehicleHealthChange( vehicle, oldHP, newHP )
{
}

function onVehicleMove( vehicle, lastX, lastY, lastZ, newX, newY, newZ )
{
}

// =========================================== P I C K U P   E V E N T S ==============================================

function onPickupClaimPicked( player, pickup )
{
	return 1;
}

function onPickupPickedUp( player, pickup )
{
}

function onPickupRespawn( pickup )
{
}

// ========================================== O B J E C T   E V E N T S ==============================================

function onObjectShot( object, player, weapon )
{
}

function onObjectBump( object, player )
{
}

// ====================================== C H E C K P O I N T   E V E N T S ==========================================

function onCheckpointEntered( player, checkpoint )
{
}

function onCheckpointExited( player, checkpoint )
{
}

// =========================================== B I N D   E V E N T S =================================================

function onKeyDown( player, key )
{
	if( key == I_KEY )
	{
	if (!player.IsSpawned) Message("asdas");
	else if( player.Vehicle ) MessagePlayer("[#FFFFFF]You no have access for open inventory now",player)
	else{
	if ( Inventories[ player.ID ] == false )
	{
	    local q = QuerySQL( Inv, "SELECT * FROM Inventory WHERE Name = '" + player.Name.tolower() + "'" );
        local DataforClient = inv[ player.ID ].Pizza + "|" + inv[ player.ID ].Hotdog + "|" + inv[ player.ID ].Burger + "|" + inv[ player.ID ].Cookie + "|"+ inv[ player.ID ].Taco + "|" + inv[ player.ID ].Water + "|" + inv[ player.ID ].Wine +"|"+inv[ player.ID ].Weed;
        local data = Stream();
        data.StartWrite(  );
        data.WriteInt(1);
        data.WriteString( DataforClient );
        data.SendStream( player );
	    Inventories[player.ID] = true;
	}
	else if( Inventories[ player.ID ] == true)
	{
		local data = Stream();
	    Inventories[ player.ID ] = false;
	    data.StartWrite();
	    data.WriteInt(2);
	    data.SendStream(player);
	}
	}
	}
}
function onKeyUp( player, key )
{
}

// ================================== E N D   OF   O F F I C I A L   E V E N T S ======================================


function SendDataToClient( player, ... )
{
    if( vargv[0] )
    {
        local     byte = vargv[0],
                len = vargv.len();
                
        if( 1 > len ) devprint( "ToClent <" + byte + "> No params specified." );
        else
        {
            Stream.StartWrite();
            Stream.WriteByte( byte );

            for( local i = 1; i < len; i++ )
            {
                switch( typeof( vargv[i] ) )
                {
                    case "integer": Stream.WriteInt( vargv[i] ); break;
                    case "string": Stream.WriteString( vargv[i] ); break;
                    case "float": Stream.WriteFloat( vargv[i] ); break;
                }
            }
            
            if( player == null ) Stream.SendStream( null );
            else if( typeof( player ) == "instance" ) Stream.SendStream( player );
            else devprint( "ToClient <" + byte + "> Player is not online." );
        }
    }
    else devprint( "ToClient: Even the byte wasn't specified..." );
}
function GetInventory(player)
{
 local q = QuerySQL(Inv, "SELECT * FROM Inventory WHERE Name = '" + escapeSQLString(player.Name) + "'");
 if (q)
 {
	inv[ player.ID ].Pizza = GetSQLColumnData(q, 1);
	inv[ player.ID ].Hotdog = GetSQLColumnData(q, 2);
	inv[ player.ID ].Burger = GetSQLColumnData(q, 3);
	inv[ player.ID ].Cookie = GetSQLColumnData(q, 4);
	inv[ player.ID ].Taco = GetSQLColumnData(q, 5);
	inv[ player.ID ].Water = GetSQLColumnData(q, 6);
	inv[ player.ID ].Wine = GetSQLColumnData(q, 7);
	inv[ player.ID ].Weed = GetSQLColumnData(q, 8);
 }
   QuerySQL( Inv, "INSERT INTO Inventory ( Name, Pizza, Hotdog, Burger, Cookie, Taco, Water, Wine, Weed ) VALUES ( '" + escapeSQLString(player.Name) + "','" + 0 +"', '" + 0 +"', '" + 0 +"', '" + 0 + "', '" + 0 +"', '" + 0 +"', '" + 0 +"', '" + 0 + "' )" );
}
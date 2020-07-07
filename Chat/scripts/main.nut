/*
Vice City Multiplayer 0.4 Blank Server (by Seby) for 64bit Windows.
You can use it to script your own server. Here you can find all events developed.

VC:MP Official: www.vc-mp.org
Forum: forum.vc-mp.org
Wiki: wiki.vc-mp.org

Style:  Normal / Soft
Credits:thnx to Sebastian for BubbleChat https://forum.vc-mp.org/?topic=4367.0 || KrOoB_ Özel Paylaşımı || KrOoB_ Ayarlamalar ve ooc/me/do

*/

local   SRV_NAME = GetServerName(),
        SRV_PASS = GetPassword();


class ooc
{
ooc = false;
me = false;
dos = false;
}
        
// Creating a connection between client and server scripts
// I'm using bytes for identification, because they are the most waste-less for the designated task
// This must be the same in both, client-side and server-side.
enum StreamType 
{
 BubbleChat = 0x01
};

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
    // server info is printed in the console
    print( "------------------------------------" );
    print( "Server name: " + SRV_NAME );
    if( SRV_PASS != "" ) print( "Password: " + SRV_PASS );
    print( "------------------------------------" );
 stats <- array(GetMaxPlayers(), null);

}

function onScriptUnload()
{
}

// =========================================== P L A Y E R   E V E N T S ==============================================

function onPlayerJoin( player )
{
	stats[ player.ID ] = ooc(); 	
}

function onPlayerPart( player, reason )
{
}

function GetTok(string, separator, n, ...)
{
local m = vargv.len() > 0 ? vargv[0] : n,
tokenized = split(string, separator),
text = "";
if (n > tokenized.len() || n < 1) return null;
for (; n <= m; n++)
{
text += text == "" ? tokenized[n-1] : separator + tokenized[n-1];
}
return text;
}

function NumTok(string, separator)
{
local tokenized = split(string, separator);
return tokenized.len();
}

function GetPlayer( plr )
{
if ( plr )
{
if ( IsNum( plr ) )
{
plr = FindPlayer( plr.tointeger() );
if ( plr ) return plr;
else return false;
}
else
{
plr = FindPlayer( plr );
if ( plr ) return plr;
else return false;
}
}
else return false;
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
	if(stats[ player.ID ].ooc == false && stats[ player.ID ].dos == false && stats[ player.ID ].me == false)
	{
		local Stream = Stream();
		Stream.WriteByte( StreamType.BubbleChat );
		Stream.WriteInt( player.ID );
		
		if( text.len() > 40 )
						{
						text = "(" + text.slice( 0, 35 ) + "...)";
						}

		Stream.WriteString( text );
		Stream.SendStream( null );
	} else 
	{
		if( stats[ player.ID ].ooc == true)
		{
			Message("[#eeeeee][OOC] "+player.Name+": "+text);
		}else
		if( stats[ player.ID ].me == true)
		{
		Message("[#FE8176][ME] "+player.Name+": "+text);	
		}else
		if( stats[ player.ID ].dos == true)
		{
		Message("[#4C86F0][DO] "+player.Name+": "+text);	
		}
	}
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
	else if (cmd == "me")
	{
		if( stats[ player.ID ].me == false)
		{
				stats[ player.ID ].dos = false;
				stats[ player.ID ].ooc = false;
			stats[ player.ID ].me = true;
			if ( stats[ player.ID ].me == true){ print("1");}
		}else {
			if( stats[ player.ID ].me == true)
			{
				stats[ player.ID ].me = false;
				if ( stats[ player.ID ].me == false){ print("2");}
			}
		}
	}
	else if (cmd == "ooc")
	{
		if( stats[ player.ID ].ooc == false)
		{
				stats[ player.ID ].me = false;
				stats[ player.ID ].dos = false;
			stats[ player.ID ].ooc = true;
			if ( stats[ player.ID ].ooc == true){ print("1");}
		}else {
			if( stats[ player.ID ].ooc == true)
			{
				stats[ player.ID ].ooc = false;
				if ( stats[ player.ID ].ooc == false){ print("2");}
			}
		}
	}
	else if (cmd == "do")
	{
		if( stats[ player.ID ].dos == false)
		{
			stats[ player.ID ].me = false;
			stats[ player.ID ].ooc = false;
			stats[ player.ID ].dos = true;
			if ( stats[ player.ID ].dos == true){ print("1");}
		}else {
			if( stats[ player.ID ].dos == true)
			{
				stats[ player.ID ].dos = false;
				if ( stats[ player.ID ].dos == false){ print("2");}
			}
		}
	}
	else if ( cmd == "ch")
	{
		Message(player.Name+": Dos:"+stats[ player.ID ].dos+" Mes:"+stats[ player.ID ].me+" OOC:"+stats[ player.ID ].ooc );
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
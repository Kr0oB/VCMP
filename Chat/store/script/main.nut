// Bubble Chat with ooc/me/do  KrOoB_ Özel Paylaşımı \\

MAX_PLAYERS <- 50; // change it with your Max Players' Limit !

enum StreamType 
{
 BubbleChat = 0x01
}

local ChatBubble_UI = array( MAX_PLAYERS );
local ChatBubble_Sender = array( MAX_PLAYERS );
local ChatBubble_Frames = array( MAX_PLAYERS, 0 );
// Would've made these constant as well but:
//  ChatBubble_Colour is not a primitive
//  ChatBubble_Scale may be adjusted in windowed mode
local ChatBubble_Colour = Colour( 255, 255, 255 );
// I'm guessing these can be considered constant
const ChatBubble_Alpha = 255;
const ChatBubble_Font = "Verdana";
local ChatBubble_Flag = GUI_FFLAG_OUTLINE;

function Script::ScriptProcess( ){
     ::ChatBubbleProc();
}

function Server::ServerData( stream ) {
     local type = stream.ReadByte();

 switch(type) 
 {
 case StreamType.BubbleChat:
            local pID = stream.ReadInt();
            ::ChatBubbleSetData( pID, World.FindPlayer( pID ), stream.ReadString() );
        break;
 }
}


//-------------------------------------------
function ChatBubbleSetData( index, player, text )
{
    // We create the label locally first
    local lbl = GUILabel( VectorScreen( 0, 0 ), ChatBubble_Colour, "" );
    // Configure the label
    lbl.FontSize = (GUI.GetScreenSize().Y / 27);
    lbl.FontName = ChatBubble_Font;
    lbl.Alpha = ChatBubble_Alpha;
    lbl.FontFlags = ChatBubble_Flag;
 lbl.Text = text;
    // Only after we know the label was created and configured we save it
    ChatBubble_UI[ index ] = lbl;
    // At this point we can store the associated player
    ChatBubble_Sender[ index ] = player;
    // Only after everything is successful we reset the frame counter
    ChatBubble_Frames[ index ] = 0;
}
//-------------------------------------------
function Distance( x1, y1, z1, x2, y2, z2 )
{
    return sqrt( (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) + (z1 - z2) * (z1 - z2) );
}
//-------------------------------------------
function ChatBubbleProc()
{
    local lplayer = World.FindLocalPlayer(), sender;
    local lpos = lplayer.Position, spos;
    local lbl, wpts, z1 = Vector( 0, 0, 1 );
    // We know there are as many frame counters as senders and we can use their index as limit
    for (local i = 0, maxi = ChatBubble_Frames.len(); i < maxi; ++i)
    {
 if( ChatBubble_UI[ i ] && ChatBubble_Frames[ i ] <= 450 )
 {
 // Stop this whole shenanigan here if:
 //  the text was updated more than 450 frames ago
 // or:
 //  the text does not even exists anymore
 if( ChatBubble_Frames[i] >= 450 || ChatBubble_UI[i] == null )
 {
 // We can just ignore this index...
 }
 // Don't process if the text was updated more than 450 frames ago
 else if( ++ChatBubble_Frames[i] == 450 || !World.FindPlayer( i ) )
 {
 ChatBubble_UI[ i ] = null;
 ChatBubble_Sender[ i ] = null;
 }
 // Don't process if there's no sender
 else if( sender = ChatBubble_Sender[ i ] && World.FindPlayer( i ) )
 {
 spos = sender.Position, lbl = ChatBubble_UI[ i ], lbl.Alpha = 0;
 // See if the sender is within local player range
 if( Distance( lpos.X, lpos.Y, lpos.Z, spos.X, spos.Y, spos.Z ) < 20 )
 {
 wpts = GUI.WorldPosToScreen( spos + z1 );
 
 lbl.Position = VectorScreen( wpts.X, wpts.Y );
 
 local ChatBubble_PosToScreen = GUI.WorldPosToScreen( spos );
 if( ChatBubble_PosToScreen.Z < 1)
 {
 lbl.Alpha = ChatBubble_Alpha;
 }
 else
 {
 lbl.Alpha = 0;
 }
 }
    
 if( sender == lplayer )
 {
 lbl.Alpha = 0;
 }
 }
 }
    }
}

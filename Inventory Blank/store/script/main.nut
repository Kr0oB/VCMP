/*
    Client-side Script
    
    Here you can find more script examples: http://forum.vc-mp.org/
    Access the forum, and go to Client Scripting.
    Wish you the best !

    VC:MP Client Documentation: http://wiki.vc-mp.org/wiki/Client-side_Scripting_Resources
*/
	Inventory<-
	{
	    window = null
	    pizza = null
	    hotdog = null
	    water = null
	    taco = null
	    weed = null
	    wine = null
		armor = null
	    cookie = null
	    hamburger = null
	    B_pizza = null
	    B_hotdog = null
	    B_water = null
	    B_taco = null
	    B_weed = null
	    B_wine = null
	    B_hamburger = null
        B_cookie = null
		B_armor = null
		pyaz = null
		hyaz = null
		wyaz = null
		tyaz = null
		heyaz = null
		weyaz = null
		wiyaz = null
		aryaz = null
		coyaz = null
	}

sX <- GUI.GetScreenSize().X;
sY <- GUI.GetScreenSize().Y;

   
//-------------------------------------------------------------------
    
function Script::ScriptLoad()
{
  
}

function Script::ScriptProcess()
{
}

function Player::PlayerShoot( player, weapon, hitEntity, hitPosition )
{
}

function Server::ServerData( stream )
{
     local StreamReadInt = stream.ReadInt(),
  StreamReadString = stream.ReadString();
 switch (StreamReadInt.tointeger())
 {
         	case 1: local data = StreamReadString; Inventory(data); break;
			case 2: GUI.SetMouseEnabled(false); Dec_Inv(); break;	
            default: break;
 }
}

function onGameResize( width, height )
{
}

function GUI::GameResize( width, height )
{
}

function GUI::ElementClick( element, mouseX, mouseY )
{
}

function GUI::ElementRelease( element, mouseX, mouseY )
{
    	if(element == Inventory.B_pizza)
	    {
	       local DATA = Stream();
    	   DATA.WriteString("Inventory.B_pizza");
    	   Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_hotdog)
	    {
	        local DATA = Stream();
    	    DATA.WriteString("Inventory.B_hotdog");
    	    Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_water)
	    {
	        local DATA = Stream();
    	    DATA.WriteString("Inventory.B_water");
    	    Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_taco)
	    {
	        local DATA = Stream();
    	    DATA.WriteString("Inventory.B_taco");
    	    Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_weed)
	    {
	        local DATA = Stream();
    	    DATA.WriteString("Inventory.B_weed");
    	    Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_wine)
	    {
	        local DATA = Stream();
    	    DATA.WriteString("Inventory.B_wine");
    	    Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_hamburger)
	    {
	        local DATA = Stream();
    	    DATA.WriteString("Inventory.B_hamburger");
    	    Server.SendData(DATA);
	    }
	    else if(element == Inventory.B_cookie)
	    {
	       local DATA = Stream();
    	   DATA.WriteString("Inventory.B_cookie");
    	   Server.SendData(DATA);
	    }
}
    function Inventory(data)
	{
	    local separator = split(data, "|"), Pizza = separator[0], Hotdog = separator[1], Burger = separator[2], Cookie = separator[3], Taco = separator[4], Water = separator[5], Wine = separator[6], Weed = separator[7];
	  
	    GUI.SetMouseEnabled(true);
		Inventory.window <- GUISprite("HUD1.png", VectorScreen(sX * 0.200, sY * 0.1));

		Inventory.pizza <- GUISprite("pizza.png", VectorScreen(sX*0.345, sY*0.187));
		Inventory.pizza.Size = VectorScreen( sX*0.08, sY*0.125 );
		Inventory.pizza.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_TABSTOP)
		Inventory.B_pizza = GUIButton(VectorScreen(sX * 0.340, sY * 0.187), VectorScreen(sX * 0.087, sY * 0.135), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.pizza); Inventory.window.AddChild(Inventory.B_pizza); Inventory.B_pizza.TextColour = Colour(255,255,250);
		Inventory.pyaz = GUILabel(VectorScreen(sX * 0.340, sY * 0.187), Colour(255, 255, 255), "["+Pizza+"]");
		Inventory.window.AddChild(Inventory.pyaz);
        Inventory.window.AddFlags(GUI_FLAG_VISIBLE);
				
		Inventory.hamburger <- GUISprite("hamburger.png", VectorScreen(sX*0.438, sY*0.198));
		Inventory.hamburger.Size = VectorScreen( sX*0.06, sY*0.105 );
		Inventory.hamburger.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_TABSTOP)
		Inventory.B_hamburger = GUIButton(VectorScreen(sX * 0.425, sY * 0.187), VectorScreen(sX * 0.087, sY * 0.135), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.hamburger); Inventory.window.AddChild(Inventory.B_hamburger); Inventory.B_hamburger.TextColour = Colour(255,250,250);
		Inventory.hyaz = GUILabel(VectorScreen(sX*0.425, sY*0.187), Colour(255, 255, 255), "["+Burger+"]");
		Inventory.window.AddChild(Inventory.hyaz);

		Inventory.taco = GUISprite("taco.png", VectorScreen(sX*0.520, sY*0.200));
		Inventory.taco.Size = VectorScreen( sX*0.08, sY*0.125 );
		Inventory.taco.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_AUTO_RESIZE | GUI_FLAG_TABSTOP)
		Inventory.B_taco = GUIButton(VectorScreen(sX * 0.510, sY * 0.187), VectorScreen(sX * 0.087, sY * 0.135), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.taco); Inventory.window.AddChild(Inventory.B_taco); Inventory.B_taco.TextColour = Colour(255,255,255,255);
		Inventory.tyaz = GUILabel(VectorScreen(sX*0.510, sY*0.187), Colour(255, 255, 255), "["+Taco+"]");
		Inventory.window.AddChild(Inventory.tyaz);

		Inventory.hotdog = GUISprite("hotdog.png", VectorScreen(sX*0.602, sY*0.196));
		Inventory.hotdog.Size = VectorScreen( sX*0.10, sY*0.15 );
		Inventory.hotdog.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_AUTO_RESIZE | GUI_FLAG_TABSTOP)
		Inventory.B_hotdog = GUIButton(VectorScreen(sX*0.596, sY*0.187), VectorScreen(sX * 0.087, sY * 0.135), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.hotdog); Inventory.window.AddChild(Inventory.B_hotdog); Inventory.B_hotdog.TextColour = Colour(255,255,255,255);
		Inventory.heyaz = GUILabel(VectorScreen(sX*0.596, sY*0.187), Colour(255, 255, 255), "["+Hotdog+"]");
		Inventory.window.AddChild(Inventory.heyaz);

		Inventory.water = GUISprite("water.png", VectorScreen(sX*0.445, sY*0.331));
		Inventory.water.Size = VectorScreen( sX*0.05, sY*0.120 );
		Inventory.water.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_TABSTOP)
		Inventory.window.AddChild(Inventory.water);
		Inventory.B_water = GUIButton(VectorScreen(sX * 0.425, sY * 0.321), VectorScreen(sX * 0.087, sY * 0.140), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.water); Inventory.window.AddChild(Inventory.B_water); Inventory.B_water.TextColour = Colour(255,255,255,255);
		Inventory.wyaz = GUILabel(VectorScreen(sX*0.426, sY * 0.322), Colour(255, 255, 255), "["+Water+"]");
		Inventory.window.AddChild(Inventory.wyaz);

		Inventory.wine = GUISprite("wine.png", VectorScreen(sX*0.530, sY*0.331));
		Inventory.wine.Size = VectorScreen( sX*0.05, sY*0.120 );
		Inventory.wine.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_TABSTOP)
		Inventory.B_wine = GUIButton(VectorScreen(sX * 0.510, sY * 0.320), VectorScreen(sX * 0.087, sY * 0.140), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.wine); Inventory.window.AddChild(Inventory.B_wine); Inventory.B_wine.TextColour = Colour(255,255,255,255);
		Inventory.wiyaz = GUILabel(VectorScreen(sX*0.511, sY * 0.321), Colour(255, 255, 255), "["+Wine+"]");
		Inventory.window.AddChild(Inventory.wiyaz);

		Inventory.cookie = GUISprite("cookie.png", VectorScreen(sX*0.350, sY*0.4825));
	    Inventory.cookie.Size = VectorScreen( sX*0.08, sY*0.125 );
	    Inventory.cookie.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_AUTO_RESIZE | GUI_FLAG_TABSTOP)
		Inventory.B_cookie = GUIButton(VectorScreen(sX*0.340, sY*0.458), VectorScreen(sX * 0.087, sY * 0.140), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
		Inventory.window.AddChild(Inventory.cookie); Inventory.window.AddChild(Inventory.B_cookie); Inventory.B_cookie.TextColour = Colour(255,255,255,255);
		Inventory.coyaz = GUILabel(VectorScreen(sX*0.341, sY*0.459), Colour(255, 255, 255), "["+Cookie+"]");
		Inventory.window.AddChild(Inventory.coyaz);

		Inventory.weed = GUISprite("weed.png", VectorScreen(sX*0.430, sY*0.477));
	    Inventory.weed.Size = VectorScreen( sX*0.10, sY*0.15 );
	    Inventory.weed.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_AUTO_RESIZE | GUI_FLAG_TABSTOP)
        Inventory.B_weed = GUIButton(VectorScreen(sX*0.425, sY*0.458), VectorScreen(sX * 0.087, sY * 0.140), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
	    Inventory.window.AddChild(Inventory.weed); Inventory.window.AddChild(Inventory.B_weed); Inventory.B_weed.TextColour = Colour(255,255,255,255);
		Inventory.weyaz = GUILabel(VectorScreen(sX*0.426, sY*0.459), Colour(255, 255, 255), "["+Weed+"]");
		Inventory.window.AddChild(Inventory.weyaz);

		Inventory.armor = GUISprite("armor.png", VectorScreen(sX*0.515, sY*0.467));
	    Inventory.armor.Size = VectorScreen( sX*0.10, sY*0.15 );
	    Inventory.armor.AddFlags( GUI_FLAG_VISIBLE | GUI_FLAG_AUTO_RESIZE | GUI_FLAG_TABSTOP)
        Inventory.B_armor = GUIButton(VectorScreen(sX*0.510, sY*0.458), VectorScreen(sX * 0.087, sY * 0.140), Colour(75, 75, 75, 40), "", GUI_FLAG_BORDER | GUI_FLAG_VISIBLE);
	    Inventory.window.AddChild(Inventory.armor); Inventory.window.AddChild(Inventory.B_armor); Inventory.B_armor.TextColour = Colour(255,255,255,255);
		Inventory.aryaz = GUILabel(VectorScreen(sX*0.511, sY*0.459), Colour(255, 255, 255), "["+Weed+"]");
		Inventory.window.AddChild(Inventory.aryaz);
	}
    
    function Dec_Inv()
    {
        Inventory.window = null;
	    Inventory.pizza = null;
	    Inventory.hotdog = null;
	    Inventory.water = null;
	    Inventory.taco = null;
	    Inventory.weed = null;
	    Inventory.wine = null;
		Inventory.armor = null;
	    Inventory.cookie = null;
	    Inventory.hamburger = null;
	    Inventory.B_pizza = null;
	    Inventory.B_hotdog = null;
	    Inventory.B_water = null;
	    Inventory.B_taco = null;
	    Inventory.B_weed = null;
	    Inventory.B_wine = null;
	    Inventory.B_hamburger = null;
        Inventory.B_cookie = null;
		Inventory.B_armor = null;
		Inventory.pyaz = null;
		Inventory.hyaz = null;
		Inventory.wyaz = null;
		Inventory.tyaz = null;
		Inventory.heyaz = null;
		Inventory.weyaz = null;
		Inventory.wiyaz = null;
		Inventory.aryaz = null;
		Inventory.coyaz = null;
    }
function GUI::ElementBlur( element )
{
}

function GUI::CheckboxToggle( checkbox, checked )
{
}

function GUI::InputReturn( editbox )
{
}

//-------------------------------------------------------------------

function SendDataToServer( ... )
{
    if( vargv[0] )
    {
        local   byte = vargv[0],
                len = vargv.len();
                
        if( 1 > len ) Console.Print( "ToClent <" + byte + "> No params specified." );
        else
        {
            local pftStream = Stream();
            pftStream.WriteByte( byte );

            for( local i = 1; i < len; i++ )
            {
                switch( typeof( vargv[i] ) )
                {
                    case "integer": pftStream.WriteInt( vargv[i] ); break;
                    case "string": pftStream.WriteString( vargv[i] ); break;
                    case "float": pftStream.WriteFloat( vargv[i] ); break;
                }
            }
            
            Server.SendData( pftStream );
        }
    }
    else Console.Print( "ToClient: Not even the byte was specified..." );
}

function GUI::WindowClose(window)
{
	switch( window )
	{
		case Inventory.window: SetMouseEnabled(false);		
    }
}
	function errorHandling(err)
    {
	    /* credits: ysc3839 */
        local stackInfos = getstackinfos(2);

        if (stackInfos)
        {
            local locals = "";
            foreach( index, value in stackInfos.locals )
            {
                if( index != "this" )
                locals = locals + "[" + index + "] " + value + "\n";
            }

            local callStacks = "";
            local level = 2;
            do 
	        {
                callStacks += "*FUNCTION [" + stackInfos.func + "()] " + stackInfos.src + " line [" + stackInfos.line + "]\n";
                level++;
            }
	        while ((stackInfos = getstackinfos(level)));

            local errorMsg = "AN ERROR HAS OCCURRED [" + err + "]\n";
            errorMsg += "\nCALLSTACK\n";
            errorMsg += callStacks;
            errorMsg += "\nLOCALS\n";
            errorMsg += locals;
            Console.Print(errorMsg)
        }
    }
	
     seterrorhandler(errorHandling);
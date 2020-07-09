//*        KrOoB_ Özel Yapımdır      *\\
//*        Credits: KrOoB_            *\\

	Bunker <-
	{
		kutu = null
	    windows = null
		next = null
		priv = null
		t_next = null
		t_priv = null
		wep = null
	}

	BunkerN <-
	{
		kutu = null
	    windows = null
		next = null
		priv = null
		t_next = null
		t_priv = null
		wep = null
		price = null
	}

	BunkerM <-
	{
		kutu = null
	    windows = null
		next = null
		priv = null
		t_next = null
		t_priv = null
		wep = null
		price = null
	}


	BunkerK <-
	{
		kutu = null
	    windows = null
		next = null
		priv = null
		t_next = null
		t_priv = null
		wep = null
		price = null
	}


	BunkerL <-
	{
		kutu = null
	    windows = null
		next = null
		priv = null
		t_next = null
		t_priv = null
		wep = null
		price = null
	}


function Server::ServerData(stream)
{
 local StreamReadInt = stream.ReadInt(),
  StreamReadString = stream.ReadString();
 switch (StreamReadInt.tointeger())
 {
			 case 36: show();	
			  break;
		default: break;
		}}

function GUI::ElementRelease(element, mouseX, mouseY)
{
		if(element==Bunker.next)
		{
			Bunker.windows = null;
			shown();
		}
		if(element==BunkerN.next)
		{
			BunkerN.windows = null;
			showndot();
		}
		if(element==BunkerM.next)
		{
			BunkerM.windows = null;
			showndoc();
		}
		if(element==BunkerK.next)
		{
			BunkerK.windows = null;
			showndol();
		}
		if(element==BunkerL.next)
		{
			BunkerL.windows = null;
			show();
		}
///////////////////////////
		if(element==Bunker.priv)
		{
			Bunker.windows = null;
			showndol();
            Console.Print("Son")
		}
		if(element==BunkerN.priv)
		{
			BunkerN.windows = null;
			show();
            Console.Print("Basta")
		}
		if(element==BunkerM.priv)
		{
			BunkerM.windows = null;
			shown();
            Console.Print("Iki")
		}
		if(element==BunkerK.priv)
		{
			BunkerK.windows = null;
			showndot();
            Console.Print("Uc")
		}
		if(element==BunkerL.priv)
		{
			BunkerL.windows = null;
			showndoc();
            Console.Print("Dort")
		}
}

function GUI::ElementClick(element, mouseX, mouseY)
{
if(element==Bunker.kutu)
{
local Data = Stream();
Data.WriteString("Bum");
Server.SendData(Data);
}
}
function show()
{
			sX <- GUI.GetScreenSize().X;
			sY <- GUI.GetScreenSize().Y;
			Bunker.windows <- GUISprite("Button1.png", VectorScreen(sX * 0.20, sY * 0.0));
			Bunker.windows.Size = VectorScreen(900, 800);
			Bunker.kutu <- GUIButton(VectorScreen(sX * 0.2337, sY * 0.4615), VectorScreen(sX * 0.100, sY * 0.05), Colour(0,0,0), "> 100$ <");
			Bunker.kutu.FontName = "Squada One";
			Bunker.kutu.FontSize = 36;
			Bunker.kutu.TextColour = Colour(2, 196, 2, 255);
			Bunker.wep <- GUISprite("Wep27.png", VectorScreen(sX * 0.217, sY * 0.3515));
			Bunker.wep.Size = VectorScreen(200, 100);
			Bunker.next <- GUIButton(VectorScreen(sX * 0.37, sY * 0.3615), VectorScreen(sX * 0.5, sY * 0.06), Colour(0,0,0), ">");
			Bunker.next.TextColour = Colour(2, 196, 2, 255);
			Bunker.next.Size = VectorScreen(50, 150);
			Bunker.priv <- GUIButton(VectorScreen(sX * 0.16, sY * 0.3615), VectorScreen(sX * 0.150, sY * 0.06), Colour(0,0,0), "<");
			Bunker.priv.TextColour = Colour(2, 196, 2, 255);			
			Bunker.priv.Size = VectorScreen(50, 150);
			Bunker.windows.AddChild(Bunker.next); Bunker.windows.AddChild(Bunker.priv); Bunker.windows.AddChild(Bunker.wep); Bunker.windows.AddChild(Bunker.kutu);
						
}

function shown()
{
			sX <- GUI.GetScreenSize().X;
			sY <- GUI.GetScreenSize().Y;
			BunkerN.windows <- GUISprite("Button1.png", VectorScreen(sX * 0.20, sY * 0.0));
			BunkerN.windows.Size = VectorScreen(900, 800);
			BunkerN.kutu <- GUIButton(VectorScreen(sX * 0.2337, sY * 0.4615), VectorScreen(sX * 0.100, sY * 0.05), Colour(0,0,0), "> 100$ <");
			BunkerN.kutu.FontName = "Squada One";
			BunkerN.kutu.FontSize = 36;
			BunkerN.kutu.TextColour = Colour(2, 196, 2, 255);
			BunkerN.wep <- GUISprite("Wep25.png", VectorScreen(sX * 0.217, sY * 0.3515));
			BunkerN.wep.Size = VectorScreen(200, 100);
			BunkerN.next <- GUIButton(VectorScreen(sX * 0.37, sY * 0.3615), VectorScreen(sX * 0.5, sY * 0.06), Colour(0,0,0), ">");
			BunkerN.next.TextColour = Colour(2, 196, 2, 255);
			BunkerN.next.Size = VectorScreen(50, 150);
			BunkerN.priv <- GUIButton(VectorScreen(sX * 0.16, sY * 0.3615), VectorScreen(sX * 0.150, sY * 0.06), Colour(0,0,0), "<");
			BunkerN.priv.TextColour = Colour(2, 196, 2, 255);			
			BunkerN.priv.Size = VectorScreen(50, 150);
			BunkerN.windows.AddChild(BunkerN.next); BunkerN.windows.AddChild(BunkerN.priv); BunkerN.windows.AddChild(BunkerN.wep); BunkerN.windows.AddChild(BunkerN.kutu);
						}

function showndot()
{
			sX <- GUI.GetScreenSize().X;
			sY <- GUI.GetScreenSize().Y;
			BunkerM.windows <- GUISprite("Button1.png", VectorScreen(sX * 0.20, sY * 0.0));
			BunkerM.windows.Size = VectorScreen(900, 800);
			BunkerM.kutu <- GUIButton(VectorScreen(sX * 0.2337, sY * 0.4615), VectorScreen(sX * 0.100, sY * 0.05), Colour(0,0,0), "> 100$ <");
			BunkerM.kutu.FontName = "Squada One";
			BunkerM.kutu.FontSize = 36;
			BunkerM.kutu.TextColour = Colour(2, 196, 2, 255);
			BunkerM.wep <- GUISprite("Wep2.png", VectorScreen(sX * 0.217, sY * 0.3515));
			BunkerM.wep.Size = VectorScreen(200, 100);
			BunkerM.next <- GUIButton(VectorScreen(sX * 0.37, sY * 0.3615), VectorScreen(sX * 0.5, sY * 0.06), Colour(0,0,0), ">");
			BunkerM.next.TextColour = Colour(2, 196, 2, 255);
			BunkerM.next.Size = VectorScreen(50, 150);
			BunkerM.priv <- GUIButton(VectorScreen(sX * 0.16, sY * 0.3615), VectorScreen(sX * 0.150, sY * 0.06), Colour(0,0,0), "<");
			BunkerM.priv.TextColour = Colour(2, 196, 2, 255);			
			BunkerM.priv.Size = VectorScreen(50, 150);
			BunkerM.windows.AddChild(BunkerM.next); BunkerM.windows.AddChild(BunkerM.priv); BunkerM.windows.AddChild(BunkerM.wep); BunkerM.windows.AddChild(BunkerM.kutu);
						}

function showndoc()
{
			sX <- GUI.GetScreenSize().X;
			sY <- GUI.GetScreenSize().Y;
			BunkerK.windows <- GUISprite("Button1.png", VectorScreen(sX * 0.20, sY * 0.0));
			BunkerK.windows.Size = VectorScreen(900, 800);
			BunkerK.kutu <- GUIButton(VectorScreen(sX * 0.2337, sY * 0.4615), VectorScreen(sX * 0.100, sY * 0.05), Colour(0,0,0), "> 100$ <");
			BunkerK.kutu.FontName = "Squada One";
			BunkerK.kutu.FontSize = 36;
			BunkerK.kutu.TextColour = Colour(2, 196, 2, 255);
			BunkerK.wep <- GUISprite("Wep18.png", VectorScreen(sX * 0.217, sY * 0.3515));
			BunkerK.wep.Size = VectorScreen(200, 100);
			BunkerK.next <- GUIButton(VectorScreen(sX * 0.37, sY * 0.3615), VectorScreen(sX * 0.5, sY * 0.06), Colour(0,0,0), ">");
			BunkerK.next.TextColour = Colour(2, 196, 2, 255);
			BunkerK.next.Size = VectorScreen(50, 150);
			BunkerK.priv <- GUIButton(VectorScreen(sX * 0.16, sY * 0.3615), VectorScreen(sX * 0.150, sY * 0.06), Colour(0,0,0), "<");
			BunkerK.priv.TextColour = Colour(2, 196, 2, 255);			
			BunkerK.priv.Size = VectorScreen(50, 150);
			BunkerK.windows.AddChild(BunkerK.next); BunkerK.windows.AddChild(BunkerK.priv); BunkerK.windows.AddChild(BunkerK.wep); BunkerK.windows.AddChild(BunkerK.kutu);
						}

function showndol()
{
			sX <- GUI.GetScreenSize().X;
			sY <- GUI.GetScreenSize().Y;
			BunkerL.windows <- GUISprite("Button1.png", VectorScreen(sX * 0.20, sY * 0.0));
			BunkerL.windows.Size = VectorScreen(900, 800);
			BunkerL.kutu <- GUIButton(VectorScreen(sX * 0.2337, sY * 0.4615), VectorScreen(sX * 0.100, sY * 0.05), Colour(0,0,0), "> 100$ <");
			BunkerL.kutu.FontName = "Squada One";
			BunkerL.kutu.FontSize = 36;
			BunkerL.kutu.TextColour = Colour(2, 196, 2, 255);
			BunkerL.wep <- GUISprite("Wep29.png", VectorScreen(sX * 0.217, sY * 0.3515));
			BunkerL.wep.Size = VectorScreen(200, 100);
			BunkerL.next <- GUIButton(VectorScreen(sX * 0.37, sY * 0.3615), VectorScreen(sX * 0.5, sY * 0.06), Colour(0,0,0), ">");
			BunkerL.next.TextColour = Colour(2, 196, 2, 255);
			BunkerL.next.Size = VectorScreen(50, 150);
			BunkerL.priv <- GUIButton(VectorScreen(sX * 0.16, sY * 0.3615), VectorScreen(sX * 0.150, sY * 0.06), Colour(0,0,0), "<");
			BunkerL.priv.TextColour = Colour(2, 196, 2, 255);			
			BunkerL.priv.Size = VectorScreen(50, 150);
			BunkerL.windows.AddChild(BunkerL.next); BunkerL.windows.AddChild(BunkerL.priv); BunkerL.windows.AddChild(BunkerL.wep); BunkerL.windows.AddChild(BunkerL.kutu);
						}

function SendDataToServer(str, int)
{
 local message = Stream();
 message.WriteInt(int.tointeger());
 message.WriteString(str);
 Server.SendData(message);
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
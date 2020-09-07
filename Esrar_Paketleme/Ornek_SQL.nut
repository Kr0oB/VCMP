
// Login sisteminde komuta yada GetInfo gibi fonskiyoa koayabilirsin
	local z = QuerySQL(Char, "SELECT * FROM Jober WHERE Name='" + escapeSQLString(player.Name) + "'");
	 if(z)
	 {
	job[ player.ID ].d_p_state = GetSQLColumnData(z, 1);
	job[ player.ID ].j1_p_state = GetSQLColumnData(z, 2);
	job[ player.ID ].j2_p_state = GetSQLColumnData(z, 3);
	job[ player.ID ].j3_p_state = GetSQLColumnData(z, 4);
     }else{
         				QuerySQL( Char, "INSERT INTO Jober ( Name, D_P_STATE, J1_P_STATE, J2_P_STATE, J3_P_STATE ) VALUES ( '" + info[ player.ID ].name + "', '"+ "true" + "', '"+ "true" +"', '"+ "true" + "', '" + "true" + "') ");
     }

     function onScriptLoad()
     {
         		QuerySQL( Char, "CREATE TABLE IF NOT EXISTS Jober ( Name TEXT, D_P_STATE TEXT, J1_P_STATE TEXT, J2_P_STATE TEXT, J3_P_STATE TEXT )" );

     }

     // Bilgileri kaydetmek için bi örnek
             QuerySQL(Char, "UPDATE Jober SET D_P_STATE = '" + job[ player.ID ].d_p_state + "' WHERE Name = '" + info[ player.ID ].name + "'");
     // Genelde oyuncular çıktığında kayeder yani onPlayerPart fonksiyonu
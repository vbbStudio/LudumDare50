/// @description Drawning player and game info
// You can write your code in this editor
	#region draw Player Info 
	draw_set_font(fnt_playerInfo);
		var xPlayerName = 565;
		var yPlayerName = 10;
		draw_set_halign(fa_center);
		draw_text(xPlayerName,yPlayerName,string(obj_Player.name));
		draw_set_color(c_green);
		draw_text(xPlayerName,yPlayerName+100,"HP: "+string(obj_Player.currentLife)+"/"+string(obj_Player.baseLife));
		draw_set_color(c_white);
		
		draw_set_halign(fa_left);
		var xPlayerInfo = 505;
		var yPlayerInfo = 140;
		draw_text(xPlayerInfo,yPlayerInfo,"ATK:"+string(obj_Player.currentAttack)+" DEF:"+string(obj_Player.currentDefence));
		draw_text(xPlayerInfo+25,yPlayerInfo+30,"DMG: "+string(obj_Player.Damage)+"\n"+"LVL: "+string(obj_Player.Level));
		draw_set_color(c_yellow);
		draw_text(xPlayerInfo,yPlayerInfo+100,"Coins:"+string(obj_Player.Coins));
		draw_set_color(c_white);
		
		if (global.gameTimeHour == 00) {
			draw_text(500,300,"     ??"+":"+"??"+"\n"+"Final Day.");
		} else {
			if (global.gameTimeMinutes < 10) {
				draw_text(500,300,"     "+string(global.gameTimeHour)+":0"+string(global.gameTimeMinutes)+"\n"+"hours left...");
			} else {
				draw_text(500,300,"     "+string(global.gameTimeHour)+":"+string(global.gameTimeMinutes)+"\n"+"hours left...");
			}	
		}
		
		
	#endregion
	
if (inCombat == false) {
	#region EventLog 
		var offset = 0;
		var drawCount =1;
		draw_set_font(fnt_combatLog);
		repeat(7) {
			draw_text(8,445-offset,global.eventLog[array_length(global.eventLog)-drawCount]);
			drawCount++;
			offset+=15;
		}
	#endregion
}
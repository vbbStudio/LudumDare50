/// @description Draw Enemies and Effects
// You can write your code in this editor
var xEnyDraw = 260;
var yEnyDraw = 176;


if (drawInfos == true) {
	draw_set_font(fnt_playerInfo);
	#region draw Enemy Info
		var xEnyName = 255;
		var yEnyName = 20;
		draw_set_halign(fa_center);
		draw_set_color(c_red);
		draw_text(xEnyName,yEnyName,obj_Enemy.name+"\n HP: "+string(obj_Enemy.currentLife)+"/"+string(obj_Enemy.baseLife));
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_sprite(obj_Enemy.enemyImage,obj_Enemy.enemySubImage,xEnyDraw,yEnyDraw);		
		var xEnyInfo = 150;
		var yEnyInfo = 260;		
		draw_text(xEnyInfo,yEnyInfo,"ATK: "+string(obj_Enemy.currentAttack)+" DEF: "+string(obj_Enemy.currentDefence)+" DMG: "+string(obj_Enemy.Damage));		
	#endregion

	
}

if (drawCombatLog == true) { /// y15 offset
	var offset = 0;
	var drawCount =1;
	draw_set_font(fnt_combatLog);
	repeat(7) {
		draw_text(8,445-offset,combatLog[array_length(combatLog)-drawCount]);
		drawCount++;
		offset+=15;
	}
	//draw_text(8,445,"Lorim Iplson Leda Nop zalope");
	//draw_text(8,445-15,"Lorim Iplson Leda Nop zalope");
	//draw_text(8,445-30,"Lorim Iplson Leda Nop zalope");
	//draw_text(8,445-45,"Lorim Iplson Leda Nop zalope");
	//draw_text(8,445-60,"Lorim Iplson Leda Nop zalope");
	//draw_text(8,445-75,"Lorim Iplson Leda Nop zalope");
	//draw_text(8,445-90,"Lorim Iplson Leda Nop zalope");
}
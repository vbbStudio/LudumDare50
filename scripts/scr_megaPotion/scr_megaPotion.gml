// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_megaPotion(){
	if (obj_Player.currentLife + 9999 <= obj_Player.baseLife) {
		obj_Player.currentLife+= 9999;
	} else {
		obj_Player.currentLife = obj_Player.baseLife;
	}
	var log = ("All points healed, current life equals "+string(obj_Player.currentLife));
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(recovery,10,false);
}
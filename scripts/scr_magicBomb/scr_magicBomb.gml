// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_magicBomb(){
	obj_Enemy.currentLife-=15;
	var log = "The magic bomb hits "+obj_Enemy.name+", 15 damage!";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(explosion,10,false);
}
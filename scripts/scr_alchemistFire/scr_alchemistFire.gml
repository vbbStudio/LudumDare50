// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_alchemistFire(){
	obj_Enemy.currentLife-=10;
	var log = "The alchemist ire hits "+obj_Enemy.name+", 10 damage!";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(explosion,10,false);
}
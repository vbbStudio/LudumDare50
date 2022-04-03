// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fireSpear(){
	obj_Enemy.currentLife-=5;
	var log = "The fire spear hits "+obj_Enemy.name+", 5 damage!";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(getHurt,10,false);
}
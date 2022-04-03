// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_javali(){
	obj_Enemy.currentLife-=3;
	var log = "The javali hits "+obj_Enemy.name+", 3 damage!";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(getHurt,10,false);
}
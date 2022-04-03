// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_potionOfHate(){
	obj_Player.currentAttack+=15;
	var log = "+15"+" ATK Points";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(buff,10,false);
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_potionOfFury(){
	obj_Player.currentAttack+=5;
	var log = "+5"+" ATK Points";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(buff,10,false);
}
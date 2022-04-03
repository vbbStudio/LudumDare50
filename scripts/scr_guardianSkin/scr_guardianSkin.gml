// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_guardianSkin(){
	obj_Player.currentDefence+=15;
	var log = "+15"+" DEF Points";
	array_push(obj_Battle.combatLog,log);
	audio_play_sound(buff,10,false);
}
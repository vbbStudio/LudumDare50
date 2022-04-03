// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_magicTimbrel(){
	if obj_gameControl.alarm[11] == -1 obj_gameControl.alarm[11] = 100;
	var log = "The Timbrel emanates a high-pitched sound...";
	array_push(obj_Battle.combatLog,log);
	var log = "...and gradually you feel your body lighten up.";
	array_push(obj_Battle.combatLog,log);
}
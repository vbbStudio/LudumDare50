// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_healingEffect(value = 5){
	if (obj_Player.currentLife + value <= obj_Player.baseLife) {
		obj_Player.currentLife+= value;
	} else {
		obj_Player.currentLife = obj_Player.baseLife;
	}
	show_message(string(value)+" healed, current life equals "+string(obj_Player.currentLife));
}
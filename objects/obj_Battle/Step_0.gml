/// @description Insert description here
// You can write your code in this editor
if (obj_gameControl.inCombat == true) {
	scr_input();
	if (combatOver == false) {
	Battle(obj_Enemy);
} else {
		drawCombatLog = false;
		drawInfos = false;
		if (instance_exists(obj_battleMenu)) {
			instance_destroy(obj_battleMenu);
		}
		if (instance_exists(obj_itemMenu)) {
			instance_destroy(obj_itemMenu);
		}
		obj_gameControl.inCombat = false;
}
}
if (obj_Player.currentLife <=0) {
	room_goto(rm_gameOver);
}
/// @description Variables and functions
// You can write your code in this editor
scr_input();
mySize = 0;
controller = 0;
itemName = "";
itemDesc = "";
obj_Battle.drawCombatLog = false;
function itemNav() {
	controller = navegationInMenu(mySize,up,down,controller);
	itemName = obj_Player.Inventory[controller].itemName;
	itemDesc = obj_Player.Inventory[controller].itemDesc;
		if (escape) {
			obj_Battle.playerOption = -1; //Placeholder
			obj_Battle.getMenuInput = true;	
			instance_destroy();
			obj_Battle.drawCombatLog = true;
		}
		if (enter) {
			var effect = obj_Player.Inventory[controller].itemEffect;
			script_execute(effect);
			array_delete(obj_Player.Inventory,controller,1);
			if (obj_Enemy.currentLife > 0) {
				obj_Battle.playerOption = -1; //Placeholder
				obj_Battle.getMenuInput = true;	
				obj_Battle.drawCombatLog = true;
				keyboard_clear(vk_enter);
				instance_destroy();
			} else {
				if obj_Battle.alarm[9] == -1 obj_Battle.alarm[9] = 60;
				var log = "Combat over..."+string(obj_Battle.playerTurnCount)+" minutes passed";
				array_push(obj_Battle.combatLog,log);
				instance_destroy();
			}
		}
	
}



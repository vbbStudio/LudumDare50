/// @description Variables and functions
// You can write your code in this editor
scr_input();
mySize = 0;
controller = 0;
itemName = "";
itemDesc = "";

function itemNav() {
	controller = navegationInMenu(mySize,up,down,controller);
	itemName = obj_Player.Inventory[controller].itemName;
	itemDesc = obj_Player.Inventory[controller].itemDesc;
		if (escape) {
			obj_Battle.playerOption = -1; //Placeholder
			obj_Battle.getMenuInput = true;	
			instance_destroy();
		}
		if (enter) {
			var effect = obj_Player.Inventory[controller].itemEffect;
			script_execute(effect);
			array_delete(obj_Player.Inventory,controller,1);
			obj_Battle.playerOption = -1; //Placeholder
			obj_Battle.getMenuInput = true;	
			instance_destroy();
		}
	
}



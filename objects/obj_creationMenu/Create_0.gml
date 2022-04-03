/// @description Insert description here
// You can write your code in this editor
io_clear();
keyboard_clear(vk_enter);
scr_input();
controller = 0;
image_speed = 0;
function creationController() {
	controller = navegationInMenu(6,up,down,controller);
	if (enter) {
		switch (controller)	 {
			case 0:
				repeat(10) {
					obj_gameDatabase.itemAddToInventory(obj_gameDatabase.potion);
				}
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			case 1:
				repeat(5) {
					obj_gameDatabase.itemAddToInventory(obj_gameDatabase.javali);
				}
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			case 2:
				obj_Player.Coins = 1000;
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			case 3:
				obj_Player.baseAttack = 10;
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			case 4:
				obj_Player.baseDefence = 10;
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			case 5:
				obj_Player.baseLife = 20;
				obj_Player.currentLife = 20;
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			case 6:
				obj_titleControl.titleLocation = 3;
				instance_destroy(self);
			break;
			io_clear();
			keyboard_clear(vk_enter);
		
		}
	}
	image_index = controller;
}


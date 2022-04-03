/// @description Insert description here
// You can write your code in this editor
scr_input();
if angelCutscene = 0 controller = navegationInMenu(3,up,down,controller);
if (controller != PORTAL) {
	angelPortal = 0;	
}
if (enter) {
	switch(controller) {
		case EXPLORE:
			//Go explore
			global.currentPlace = gamePlaces.explore;
			var log = "Going explore...10 minutes passed.";
			array_push(global.eventLog,log);
			global.gameTimeMinutes-=10;
			instance_destroy(self);
		break;
		case SHOP:
		break;
		case INN:
		break;
		case PORTAL:
			if (angelPortal <2) {
				var log = "This portal will take you to the Angel of Life. Press ENTER again to enter.";
				array_push(global.eventLog,log);
				angelPortal+=2;
			} else {
				if alarm[11] == -1 alarm[11] = 60;
				angelCutscene+=1;
				obj_gameDatabase.itemAddToInventory(obj_gameDatabase.timbral);
				var log = "Going towards your destiny...";
				array_push(global.eventLog,log);
			}
		break;
		
	}
}

image_index = controller;
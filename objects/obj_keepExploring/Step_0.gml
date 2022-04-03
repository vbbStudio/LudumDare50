/// @description Insert description here
// You can write your code in this editor
scr_input();
controller = navegationInMenu(1,up,down,controller);
if (enter) {
	switch(controller) {
		case YES:
		if (global.currentPlace == gamePlaces.forest) {
			var log = "Exploring the Forest...1 minute passed";
			array_push(global.eventLog,log);
			global.gameTimeMinutes-=1;
			
		}
		creator.alarm[11] = 120;
		creator.returnCount+=1;
		if (!instance_exists(obj_Battle)) {
			instance_create_layer(0,0,"Instances",obj_Battle);
		}
		instance_destroy(self);
		break;
		case NO:
			var log = "Returning to home..."+string(creator.returnCount*2)+" minutes passed";
			array_push(global.eventLog,log);
			global.gameTimeMinutes-=(creator.returnCount*2);
			global.currentPlace = gamePlaces.explore;
			instance_destroy(obj_Battle);
			instance_destroy(self);
		break;	
	}
}

image_index = controller;
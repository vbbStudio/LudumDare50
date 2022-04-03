/// @description Insert description here
// You can write your code in this editor
scr_input();
controller = navegationInMenu(3,up,down,controller);

if (enter) {
	switch(controller) {
		case FLOREST:
			//Go explore
			global.currentPlace = gamePlaces.forest;
			var log = "Exploring the Forest...10 minutes passed.";
			global.gameTimeMinutes-=10;
			array_push(global.eventLog,log);
			audio_play_sound(exploring,10,false);
			instance_destroy(self);
			
		break;
		case CAVE:
			global.currentPlace = gamePlaces.cave;
			var log = "Exploring the Cave...10 minutes passed.";
			global.gameTimeMinutes-=10;
			array_push(global.eventLog,log);
			audio_play_sound(exploring,10,false);
			instance_destroy(self);
		break;
		case RUINS:
			global.currentPlace = gamePlaces.ruins;
			var log = "Exploring the Ruins...10 minutes passed.";
			global.gameTimeMinutes-=10;
			array_push(global.eventLog,log);
			audio_play_sound(exploring,10,false);
			instance_destroy(self);
		break;
		case CITY:
			global.currentPlace = gamePlaces.city;
			var log = "Returning to city...10 minutes passaed";
			global.gameTimeMinutes-=10;
			array_push(global.eventLog,log);
			audio_play_sound(exploring,10,false);
			instance_destroy(self);
		break;
		
	}
}

image_index = controller;
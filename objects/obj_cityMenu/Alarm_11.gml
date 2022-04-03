/// @description Teleporting to the Angel of Life
// You can write your code in this editor

switch (angelCutscene) {
	case 1:
		var log = "Before you go, please take this magic timbrel.";
		array_push(global.eventLog,log);
		alarm[11] = 100;
		angelCutscene+=1;
	break;
	case 2:
		var log = "With it you can go back in time if things get out of hand.";
		array_push(global.eventLog,log);
		alarm[11] = 100;
		angelCutscene+=1;
	break;
	case 3:
		var log = "You will lose all your coins...";
		array_push(global.eventLog,log);
		alarm[11] = 100;
		angelCutscene+=1;
	break;
	case 4:
		var log = "...but you will still have your physical strength and items to try again.";
		array_push(global.eventLog,log);
		alarm[11] = 100;
		angelCutscene+=1;
	break;
	case 5:
		var log = "Good luck!";
		array_push(global.eventLog,log);
		alarm[11] = 100;
		angelCutscene+=1;
	break;
	case 6:
		global.currentPlace = gamePlaces.portal;
		global.gameTimeHour = 00;
		global.gameTimeMinutes = 00;
		
		instance_destroy(self);
	break;
}
/// @description Insert description here
// You can write your code in this editor

gameSceneControl();

if (global.gameTimeHour > 0) {
	if (global.gameTimeMinutes < 0) {
		global.gameTimeHour-=1;
		global.gameTimeMinutes = 60;
	}
} else {
	if (global.currentPlace != gamePlaces.portal) {
		global.gameTimeHour = 00;
		global.gameTimeMinutes = 00;
		if (global.currentPlace != gamePlaces.city) {
			global.currentPlace = gamePlaces.city;
			if (!instance_exists(obj_cityMenu)) {
				instance_create_layer(174,94,"Instances",obj_cityMenu);
			}
			obj_cityMenu.angelPortal = 4;
			obj_cityMenu.controller = PORTAL;
			event_perform(ev_keypress,vk_enter);
		} else {
			obj_cityMenu.angelPortal = 4;
			obj_cityMenu.controller = PORTAL;
			event_perform(ev_keypress,vk_enter);
		}
	}
}


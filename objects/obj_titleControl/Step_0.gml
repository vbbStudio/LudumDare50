/// @description Insert description here
// You can write your code in this editor
scr_input();
if audio_is_playing(finalDayTheme) == false {
	audio_play_sound(finalDayTheme,10,true);
}
if (enter) {
	switch(titleLocation) {
		
		case 0:
			titleLocation = 1;
		break;
		case 1:
			obj_Player.name = charName;
			titleLocation = 2;
			drawName = false;
			keyboard_check(vk_enter);
		break;
		case 2:
		break;
		case 3:
			if (alarm[11] == -1) room_goto_next();
			audio_stop_sound(finalDayTheme);
		break;
	
	}
	
}



switch(titleLocation) {
		
	case 0:
	break;
	case 1:
		layer_background_index(back_id,1);
		if (string_length(keyboard_string)<=8) {;
			charName = keyboard_string;
		}
		drawName = true;
	break;
	case 2:
	layer_background_index(back_id,2);
		if (!instance_exists(obj_creationMenu)) {
			instance_create_layer(90,148,"Instances",obj_creationMenu);
		}
	break;
	case 3:
		if (instance_exists(obj_creationMenu)) {
		instance_destroy(obj_creationMenu)	;
		}
	layer_background_index(back_id,3);
	break;
	
}
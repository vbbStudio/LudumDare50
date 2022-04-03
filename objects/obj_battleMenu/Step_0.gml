/// @description Insert description here
// You can write your code in this editor
scr_input()
if (instance_exists(obj_Battle)) {
	if (obj_Battle.getMenuInput == true) {
		///Not final input code!!!!
		control = navegationInMenu(3,left,right,control);
		image_index = control;
	}
		if (enter) {
			switch (control) {
				case 0:
					obj_Battle.playerOption = 1;
				break;
				case 1:
					obj_Battle.playerOption = 2;
				break;
				case 2:
					obj_Battle.playerOption = 3;
				break;
				case 3:
					obj_Battle.playerOption = 0;
				break;
			}
			control = 0;
			obj_Battle.getMenuInput = false;
		}
} else {
	instance_destroy(self);
}
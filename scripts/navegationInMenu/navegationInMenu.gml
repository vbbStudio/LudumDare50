// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// @param  maxOptions The max number of options
// @param increaseKey The key to increase the control
// @param decreaseKey The key to decrease the control
// @param Control Control variable

function navegationInMenu(maxOptions,increaseKey,decreaseKey,control){
	
	if (decreaseKey) {
		if (control == maxOptions) {
			control = 0;	
		} else {
			control +=1;	
		}
	} 

	if (increaseKey) {
		if (control == 0) {
			control = maxOptions;	
		} else {
			control -=1;	
		}
	}
	
	return control;
}
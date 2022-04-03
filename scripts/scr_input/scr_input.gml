// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_input(){
	right = keyboard_check_pressed(vk_right);
	left =  keyboard_check_pressed(vk_left);
	up = keyboard_check_pressed(vk_up);
	down = keyboard_check_pressed(vk_down);
	enter = keyboard_check_pressed(vk_enter);		
	escape = keyboard_check_pressed(vk_escape);

if (right || left || up || down) {
		audio_play_sound(movingMenu,10,false);

}

if (enter) {
	audio_play_sound(confirm,10,false);
}
if (escape) {
	audio_play_sound(cancel,10,false);
}

}


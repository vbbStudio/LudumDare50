/// @description Insert description here
// You can write your code in this editor
if audio_is_playing(finalDayTheme) == false {
	audio_play_sound(finalDayTheme,10,true);
}
scr_input();
lay_id = layer_get_id("Background");
back_id = layer_background_get_id(lay_id);
layer_background_index(back_id,0);
titleLocation = 0;
drawName = false;
name = "";
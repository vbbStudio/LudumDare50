/// @description Insert description here
// You can write your code in this editor

if (drawName) {
	draw_set_font(fnt_Name);
	draw_set_color(make_color_rgb(203,219,252));
	draw_set_halign(fa_middle);
	draw_text(room_width/2,room_height/2,charName);
	draw_set_halign(fa_left);
}
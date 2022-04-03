/// @description Insert description here
// You can write your code in this editor

gameSceneControl();

if (global.gameTimeHour > 0) {
	if (global.gameTimeMinutes < 0) {
		global.gameTimeHour-=1;
		global.gameTimeMinutes = 60;
	}
} else {
		global.gameTimeHour = 00;
		global.gameTimeMinutes = 00;
}
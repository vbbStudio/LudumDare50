/// @description Insert description here
// You can write your code in this editor
scr_input();
if (explorationAction == RESOLVINGCOMBAT) {
	solvingCombat();
}

if (explorationAction == LOOT) {
	if (enter) {
		itemLoot = 0;
		getRandomLoot = false;
		explorationAction = KEEPQUESTION;
		ruinsAmbient();
	}
}
if (global.currentPlace != gamePlaces.ruins) {
	instance_destroy(self);
}
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
		caveAmbient();
	}
}
if (global.currentPlace != gamePlaces.cave) {
	instance_destroy(self);
}
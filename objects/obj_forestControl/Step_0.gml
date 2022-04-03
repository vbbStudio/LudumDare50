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
		forestAmbient();
	}
}
if (global.currentPlace != gamePlaces.forest) {
	instance_destroy(self);
}
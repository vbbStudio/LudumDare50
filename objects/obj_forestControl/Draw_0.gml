/// @description Insert description here
// You can write your code in this editor
if (getCombatLoot == true) {
	draw_text(130,160,"You got "+string(coinsLoot)+" Coins From "+string(obj_Enemy.name)+"\n"+"Press enter to continue...");
}

if (getRandomLoot == true) {
	draw_text(130,160,"You got "+itemLoot.itemName+"!\n"+itemLoot.itemDesc+"\n"+"Press enter to continue...");
}
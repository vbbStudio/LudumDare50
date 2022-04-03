/// @description Insert description here
// You can write your code in this editor
enum gamePlaces{
	city,
	explore,
	shop,
	inn,
	battle,
	forest,
	ruins,
	cave,
	portal
}

global.gameTimeHour = 23;
global.gameTimeMinutes = 59;

global.currentPlace = gamePlaces.city;
lay_id = layer_get_id("Background");
back_id = layer_background_get_id(lay_id);
layer_background_index(back_id,1);
inCombat = false;
global.eventLog = array_create(7,"");

function gameSceneControl() {
	switch(global.currentPlace) {
		case gamePlaces.city:
			if (!instance_exists(obj_cityMenu)) {
				instance_create_layer(174,94,"Instances",obj_cityMenu);
			}		
		break;
		case gamePlaces.explore:
			if (!instance_exists(obj_exploreMenu)) {
				instance_create_layer(174,94,"Instances",obj_exploreMenu);
			}
			
		break;
		case gamePlaces.forest:
			if (!instance_exists(obj_forestControl)) {
				instance_create_layer(0,0,"Instances",obj_forestControl);
				if (!instance_exists(obj_Battle)) {
					instance_create_layer(0,0,"Instances",obj_Battle);
				}
			}	
		break;
		case gamePlaces.portal:
			if (!instance_exists(obj_Battle)) {
				instance_create_layer(0,0,"Instances",obj_Battle);
			}
			if (!instance_exists(obj_Enemy)) {
				var monsterNumbers = new Monster("Angel of Life",50,60,10000,39,30,999);
				monster =instance_create_layer(0,0,"Instances",obj_Enemy);
				monster.name = monsterNumbers.monsterName;
				monster.baseAttack = monsterNumbers.monsterAttack;
				monster.currentAttack = monsterNumbers.monsterAttack;
				monster.baseDefence = monsterNumbers.monsterDefence;
				monster.currentDefence = monsterNumbers.monsterDefence;
				monster.baseLife = monsterNumbers.monsterLife;
				monster.currentLife = monsterNumbers.monsterLife;
				monster.Damage = monsterNumbers.monsterDamage;
				monster.Level = monsterNumbers.monsterLevel;
				monster.Coins = monsterNumbers.monsterCoins;
				initCombat();
			}
		break;
	}
}
function initCombat() {
			obj_gameControl.inCombat = true;
			obj_Battle.drawInfos = true; 
			obj_Battle.drawCombatLog = true;
			obj_Battle.drawInfos = true;	
}
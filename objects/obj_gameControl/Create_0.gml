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
layer_background_index(back_id,0);
inCombat = false;
global.eventLog = array_create(7,"");

function gameSceneControl() {
	switch(global.currentPlace) {
		case gamePlaces.city:
			layer_background_index(back_id,0);
			if (!instance_exists(obj_cityMenu)) {
				instance_create_layer(174,94,"Instances",obj_cityMenu);
			}		
		break;
		case gamePlaces.shop:
			if (!instance_exists(obj_menuShop)) {
				instance_create_layer(174,94,"Instances",obj_menuShop);
			}		
		case gamePlaces.inn:
			if (!instance_exists(obj_innMenu)) {
				instance_create_layer(174,94,"Instances",obj_innMenu);
			}	
		break;
		case gamePlaces.explore:
		layer_background_index(back_id,0);
			if (!instance_exists(obj_exploreMenu)) {
				instance_create_layer(174,94,"Instances",obj_exploreMenu);
			}
		break;
		case gamePlaces.forest:
		layer_background_index(back_id,1);
			if (!instance_exists(obj_forestControl)) {
				instance_create_layer(0,0,"Instances",obj_forestControl);
				if (!instance_exists(obj_Battle)) {
					instance_create_layer(0,0,"Instances",obj_Battle);
				}
			}	
		break;
		case gamePlaces.ruins:
		layer_background_index(back_id,3);
			if (!instance_exists(obj_ruinsControl)) {
				instance_create_layer(0,0,"Instances",obj_ruinsControl);
				if (!instance_exists(obj_Battle)) {
					instance_create_layer(0,0,"Instances",obj_Battle);
				}
			}	
		break;
		case gamePlaces.cave:
		layer_background_index(back_id,2);
			if (!instance_exists(obj_caveControl)) {
				instance_create_layer(0,0,"Instances",obj_caveControl);
				if (!instance_exists(obj_Battle)) {
					instance_create_layer(0,0,"Instances",obj_Battle);
				}
			}	
		break;
		case gamePlaces.portal:
		if (!audio_is_playing(finalBoss)) {
			audio_play_sound(finalBoss,10,true);
		}
		layer_background_index(back_id,4);
			if (!instance_exists(obj_Battle)) {
				instance_create_layer(0,0,"Instances",obj_Battle);
			}
			if (!instance_exists(obj_Enemy)) {
				var monsterNumbers = new Monster("Angel of Life",50,60,obj_Player.angelOfLifeHP,39,30,999,spr_angelOfLife);
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
				monster.enemyImage = monsterNumbers.monsterSprite;
				monster.enemySubImage = 0;
				initCombat();
				if (!audio_is_playing(finalBoss)) {
					audio_play_sound(finalBoss,10,true);
				}
			}
			if (obj_Enemy.currentLife <=0) {
				room_goto(rm_victory);
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
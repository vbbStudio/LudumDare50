/// @description Insert description here
// You can write your code in this editor
getCombatLoot = false;
getRandomLoot = false;
coinsLoot = 0;
itemLoot = 0;
scr_input();
explorationAction = irandom_range(COMBAT,LOOT);	
returnCount = 1;
function caveAmbient() {
	switch(explorationAction) {
		case COMBAT:
			if (!instance_exists(obj_Enemy)) {
				var monsterNumbers = generateMonsters(returnCount,obj_Player.Level);
				//var monsterNumbers = new Monster("Guerrerinho",5,1,10,3,2,30);
				//monster =instance_create_layer(0,0,"Instances",obj_Enemy);
				//monster.name = monsterNumbers.monsterName;
				//monster.baseAttack = monsterNumbers.monsterAttack;
				//monster.currentAttack = monsterNumbers.monsterAttack;
				//monster.baseDefence = monsterNumbers.monsterDefence;
				//monster.currentDefence = monsterNumbers.monsterDefence;
				//monster.baseLife = monsterNumbers.monsterLife;
				//monster.currentLife = monsterNumbers.monsterLife;
				//monster.Damage = monsterNumbers.monsterDamage;
				//monster.Level = monsterNumbers.monsterLevel;
				//monster.Coins = monsterNumbers.monsterCoins;
				initCombat();
				explorationAction = RESOLVINGCOMBAT;
			}
		break;
		case LOOT:
		audio_play_sound(getLoot,10,false);
			var log = "Loot Find!";
			itemLoot = choose(obj_gameDatabase.javali,obj_gameDatabase.fireSpear,obj_gameDatabase.alchemistFire,obj_gameDatabase.magicBomb);
			array_push(global.eventLog,log);
			getRandomLoot = true;
			obj_gameDatabase.itemAddToInventory(itemLoot);
		break;
		case KEEPQUESTION:
			if (!instance_exists(obj_keepExploring)) {
				var keep = instance_create_layer(174,94,"Instances",obj_keepExploring);
				keep.creator = id;
				instance_destroy(obj_Battle);

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

function solvingCombat() {
	switch (explorationAction) {
		case RESOLVINGCOMBAT:
			if (obj_Battle.combatOver == true) {
				if (obj_Player.currentLife > 0 && obj_Battle.playerRun == -1 ){
						if getCombatLoot == false {
							coinsLoot = gettingCombatLoot(obj_Enemy.Level,obj_Enemy.Coins)+((obj_Battle.playerTurnCount+obj_Battle.enemyTurnCount)*obj_Enemy.Level);
							getCombatLoot = true;
							var log = "Victory! "+string(coinsLoot)+" Coins won!";
							array_push(global.eventLog,log);
						}
						if (enter) {
							instance_destroy(obj_Enemy);
							obj_Player.Coins += coinsLoot;
							getCombatLoot = false;
							explorationAction = KEEPQUESTION;
							obj_gameControl.inCombat = false;
							caveAmbient();
						}
				} else if (obj_Player.currentLife > 0 && obj_Battle.playerRun == 1)  {
					instance_destroy(obj_Enemy);
					getCombatLoot = false;
					explorationAction = KEEPQUESTION;
					obj_gameControl.inCombat = false;
					caveAmbient();
				} else {
					show_message("Game Over");
				}
			}
		break;
	}
}

function gettingCombatLoot(Level,Coins) {
	return Level*Coins+(obj_Player*irandom(Coins));	
}



alarm[11] = 120;
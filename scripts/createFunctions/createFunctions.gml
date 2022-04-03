// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Weapon(level,name,damage,goldValue,desc) constructor 
{
	weaponLevel = level;
	weaponName = name;
	weaponDamage = damage;
	weaponGoldValue = goldValue;
	weaponDesc = desc;
}

function Item(name,effect,goldValue,desc) constructor {
	
	itemName = name;
	itemEffect = effect;
	itemGold = goldValue;
	itemDesc = desc;
	
}

function Monster(name,baseAttack,baseDefence,baseLife,damage,level,coins,sprite) constructor {
		monsterName = name;
		monsterAttack = baseAttack;
		monsterDefence = baseDefence;
		monsterLife = baseLife;
		monsterDamage = damage;
		monsterLevel = level;
		monsterCoins = coins;
		monsterSprite = sprite;
		
}

function generateMonsters(howFar,playerLevel) {
				var nameAndSprite = irandom(array_length(obj_gameDatabase.enemiesNames)-1);
				var monsterNumbers = new Monster(obj_gameDatabase.enemiesNames[nameAndSprite],combatStatus(playerLevel)+round(howFar/2),combatStatus(playerLevel)+round(howFar/2),combatStatus(playerLevel+round(howFar/2)+1)*irandom(5),combatStatus(playerLevel),howFar,combatStatus(playerLevel)*irandom(30),spr_enemies);
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
				monster.enemySubImage = nameAndSprite;
}

function combatStatus(level) {
		return irandom_range(1+level,3+level);
}
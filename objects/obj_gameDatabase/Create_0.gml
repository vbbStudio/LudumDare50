/// @description Item dataBase and Constructor
// You can write your code in this editor


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





potion = new Item("Potion",scr_healingEffect,"50","This potion heal your life");
timbral = new Item("Magic Timbral",scr_magicTimbrel,"0","A magical timbral that can go back in time.");

angelOfLife = new Monster("Angel Of Life",50,50,10000,30,100,100000);
function itemAddToInventory(item) {
	array_push(obj_Player.Inventory,item);
}

enemiesNames[0] = "Black Spider";
enemiesNames[1] = "Lizard Soldier";
enemiesNames[2] = "Ground Dragon";
enemiesNames[3] = "Plant Hulk";
enemiesNames[4] = "Galaxy Frog";
enemiesNames[5] = "Mud Frog";
enemiesNames[6] = "Mush Soldier";
enemiesNames[7] = "Claw Warrior";
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


potion = new Item("Potion",scr_potion,"50","This potion restores 5 HP.");
ultraPotion = new Item("Ultra Potion",scr_ultraPotion,"50","This potion restores 10 HP.");
MegaPotion = new Item("Mega Potion",scr_megaPotion,"50","This potion restores all HP.");
ironSkin = new Item("Iron Skin Potion",scr_ironSkin,"50","This potion gives you +5 defense points this turn..");
guardianPotion = new Item("Guardian Potion",scr_guardianSkin,"50","This potion gives you +15 defense points this turn..");
potionOfFury = new Item("Potion of Fury",scr_potionOfFury,"50","This potion gives you +5 attacks points this turn..");
potionOfHate = new Item("Potion of Hate",scr_potionOfHate,"50","This potion gives you +15 attacks points this turn..");

javali = new Item("Javali",scr_javali,"50","Applies 3 DMG to enemy");
fireSpear = new Item("Fire Spear",scr_fireSpear,"50","Applies 5 DMG to enemy");
alchemistFire = new Item("Alchemist Fire",scr_alchemistFire,"50","Applies 10 DMG to enemy");
magicBomb = new Item("Magic Bomb",scr_magicBomb,"50","Applies 15 DMG to enemy");





timbral = new Item("Magic Timbral",scr_magicTimbrel,"0","A magical timbral that can go back in time.");

angelOfLife = new Monster("Angel Of Life",50,50,10000,30,100,100000,spr_angelOfLife);


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


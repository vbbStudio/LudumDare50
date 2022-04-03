/// @description Player Variables and Functions
// You can write your code in this editor

#region Player attributes

//Basic Attributes
name = "";

baseAttack = 5;
currentAttack = 5;

baseDefence = 5;
currentDefence = 5;

baseLife = 10;
currentLife = 10;

Level = 0;

Coins = 500;

playerWeapon = 0;
playerArmor = 0;

////Item Position/Quantity = Item Id;
Inventory = array_create(0,noone);
angelOfLifeHP = 10000;


//Equipament Attributes
baseDamage = 2;
Damage = 0;
#endregion


function updateArmor() {
	currentDefence += playerArmor;	
}
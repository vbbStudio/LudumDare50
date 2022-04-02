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

potion = new Item("Potion",scr_healingEffect,"50","This potion heal your life");
scroll = new Item("Scroll","scr_heal","50","This is a scroll");

function itemAddToInventory(item) {
	array_push(obj_Player.Inventory,item);
}


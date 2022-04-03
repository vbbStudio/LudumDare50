/// @description Insert description here
// You can write your code in this editor
scr_input();
var playerLevel = obj_Player.Level;
if (instance_exists(obj_innMenu)) {
	instance_destroy(obj_innMenu);
}

controller = navegationInMenu(2,up,down,controller);
	switch(controller) {
		case WEAPON:	
			confirmArmor = 0;
		break;
		case ARMOR:
			confirmWeapon = 0;
		break;
		case EXITSHOP:
			confirmWeapon = 0;
			confirmArmor = 0;
		break;
		
	}
	
if (enter) {
	switch(controller) {
		case WEAPON:
		if (confirmWeapon == 0) {
			confirmWeapon +=1;
			var log = "A LVL "+string(playerLevel)+" weapon costs "+ string(weaponPriceEqp) +" and have "+string(weapon)+" DMG";
			array_push(global.eventLog,log);
			var log = "Press enter again to buy.";
			array_push(global.eventLog,log);
		} else {
			if (obj_Player.Coins >= weaponPriceEqp) {
				obj_Player.Coins -= weaponPriceEqp;
				var log = "You buy a LVL "+string(playerLevel)+" Weapon and now have you have "+string(weapon)+" DMG";
				obj_Player.playerWeapon = weapon;
				confirmWeapon = 0;
				array_push(global.eventLog,log);	
			} else {
				var log = "You don't have enough Coins to buy this weapon.";
				array_push(global.eventLog,log);
				confirmWeapon = 0;
			}
		}
			
		break;
		case ARMOR:
		if (confirmArmor == 0) {
			confirmArmor +=1;
			var log = "A LVL "+string(playerLevel)+" armor costs "+ string(armorPriceEqp) +" and gives you +"+string(armor)+" DEF";
			array_push(global.eventLog,log);
			var log = "Press enter again to buy.";
			array_push(global.eventLog,log);
		} else {
			if (obj_Player.Coins >= armorPriceEqp) {
				obj_Player.Coins -= armorPriceEqp;
				var log = "You buy a LVL "+string(playerLevel)+" Armor and now have +"+string(armor)+" DEF";
				obj_Player.playerArmor = armor;
				obj_Player.updateArmor();
				confirmArmor = 0;
				array_push(global.eventLog,log);	
			} else {
				var log = "You don't have enough Coins to buy this armor.";
				array_push(global.eventLog,log);
				confirmArmor = 0;
			}
		}
		break;
		case EXITSHOP:
			global.currentPlace = gamePlaces.city;
			var log = "Returning to city...";
			array_push(global.eventLog,log);
			instance_destroy(self);
			if (instance_exists(obj_innMenu)) {
				instance_destroy(obj_innMenu);
			}
		break;
		
	}
}

image_index = controller;
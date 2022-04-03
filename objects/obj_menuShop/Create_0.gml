/// @description Insert description here
// You can write your code in this editor
controller = 0;
scr_input();
confirmWeapon = 0;
confirmArmor = 0;

weapon = createWeapon(obj_Player.Level);
armor = createEquipament(obj_Player.Level);
armorPriceEqp = armorPrice(obj_Player.Level);
weaponPriceEqp = weaponPrice(obj_Player.Level);


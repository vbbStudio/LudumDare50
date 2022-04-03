/// @description Insert description here
// You can write your code in this editor
scr_input();
controller = navegationInMenu(4,up,down,controller);
	switch(controller) {
		case SLEEP:
			lvlATKControl = 0;
			lvlDEFControl = 0;
			lvlHPControl = 0;
		break;
		case LVLUPHP:
			sleepControl = 0;
			lvlATKControl = 0;
			lvlDEFControl = 0;
		break;
		case LVLUPATK:
			sleepControl = 0;
			lvlDEFControl = 0;
			lvlHPControl = 0;
		break;
		case LVLUPDEF:
			sleepControl = 0;
			lvlATKControl = 0;
			lvlHPControl = 0;
		break;
		case INNEXIT:
			sleepControl = 0;
			lvlATKControl = 0;
			lvlDEFControl = 0;
			lvlHPControl = 0;
		break;
	}

if (enter) {
	switch(controller) {
		case SLEEP:
			if (obj_Player.currentLife == obj_Player.baseLife) {
				var log = "Are not you tired....";
				array_push(global.eventLog,log);	
			}
			if (obj_Player.currentLife < obj_Player.baseLife) {
				if (sleepControl <2) {
					var log = "You can sleep for free here. You need "+string(ceil(abs(obj_Player.currentLife - obj_Player.baseLife)/2))+" hours of sleep to recover.";
					array_push(global.eventLog,log);	
					var log = "Press enter again to sleep.";
					array_push(global.eventLog,log);	
					sleepControl = 2;
				} else {
					var log = "you slept for "+string(ceil(abs(obj_Player.currentLife - obj_Player.baseLife)/2))+" hours";
					global.gameTimeHour -= ceil(abs(obj_Player.currentLife - obj_Player.baseLife)/2);
					array_push(global.eventLog,log);
					obj_Player.currentLife = obj_Player.baseLife;
					sleepControl = 0;	
				}
			}

		break;
		
		case LVLUPHP:
				if (lvlHPControl <2) {
					var log = "You can level up to level "+string(obj_Player.Level+1)+" and increase your HP to "+string(obj_Player.Level+1)+" for "+string(HPPrice)+" Coins";
					array_push(global.eventLog,log);	
					var log = "Press enter again to level up HP";
					array_push(global.eventLog,log);	
					lvlHPControl = 2;
				} else {
					if (obj_Player.Coins >= HPPrice) {
						obj_Player.Coins -= HPPrice;
							levelUpHP(obj_Player.Level);
							var log = "You level up your HP!";
							array_push(global.eventLog,log);
							ATKPrice = obj_Player.baseAttack*50;
							HPPrice = obj_Player.baseLife*100;
							DEFPrice = obj_Player.baseDefence*80;
							lvlHPControl = 0;	
						} else {
							var log = "You don't have enough Coins to level up.";
							array_push(global.eventLog,log);
							lvlHPControl = 0;
						}
				}
		break;
		case LVLUPATK:
				if (lvlATKControl <2) {
					var log = "You can level up to level "+string(obj_Player.Level+1)+" and increase your ATK to "+string(obj_Player.Level+1)+" for "+string(ATKPrice)+" Coins";
					array_push(global.eventLog,log);	
					var log = "Press enter again to level up ATK";
					array_push(global.eventLog,log);	
					lvlATKControl = 2;
				} else {
					if (obj_Player.Coins >= ATKPrice) {
						obj_Player.Coins -= ATKPrice;
							levelUpATK(obj_Player.Level);
							var log = "You level up your ATK!";
							array_push(global.eventLog,log);
							ATKPrice = obj_Player.baseAttack*50;
							HPPrice = obj_Player.baseLife*100;
							DEFPrice = obj_Player.baseDefence*80;
							lvlATKControl = 0;	
						} else {
							var log = "You don't have enough Coins to level up.";
							array_push(global.eventLog,log);
							lvlATKControl = 0;
						}
				}
		break;
		case LVLUPDEF:
				if (lvlDEFControl <2) {
					var log = "You can level up to level "+string(obj_Player.Level+1)+" and increase your DEF to "+string(obj_Player.Level+1)+" for "+string(DEFPrice)+" Coins";
					array_push(global.eventLog,log);	
					var log = "Press enter again to level up DEF";
					array_push(global.eventLog,log);	
					lvlDEFControl = 2;
				} else {
					if (obj_Player.Coins >= DEFPrice) {
						obj_Player.Coins -= DEFPrice;
							levelUpDEF(obj_Player.Level);
							var log = "You level up your DEF!";
							array_push(global.eventLog,log);
							ATKPrice = obj_Player.baseAttack*50;
							HPPrice = obj_Player.baseLife*100;
							DEFPrice = obj_Player.baseDefence*80;
							lvlDEFControl = 0;	
						} else {
							var log = "You don't have enough Coins to level up.";
							array_push(global.eventLog,log);
							lvlDEFControl = 0;
						}
				}
		break;
	
		case INNEXIT:
			global.currentPlace = gamePlaces.city;
			var log = "Returning to city...";
			array_push(global.eventLog,log);
			instance_destroy(self);
		break;
		
	}
}

image_index = controller;
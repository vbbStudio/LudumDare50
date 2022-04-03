/// @description Functions and variables of a battle
// You can write your code in this editor
randomize();
scr_input();
turn = PLAYERTURN;
playerOption = -1; //Placeholder
getMenuInput = true;
drawInfos = false;
drawCombatLog = false;
enemyTurnCount = 0;
playerTurnCount = 0;
enemyAlreadyMove = false;
playerAlreadyMove = false;
combatOver = false;
playerRun = -1;
combatLog[0] = "";
combatLog[1] = "";
combatLog[2] = "";
combatLog[3] = "";
combatLog[4] = "";
combatLog[5] = "";
combatLog[6] = "";
function Battle(enemy) {
	
	if (!instance_exists(obj_battleMenu)) {
		instance_create_layer(96,320,"Instances",obj_battleMenu);
			var log = "An enemy apears!";
			array_push(combatLog,log);
	}
	if (turn == PLAYERTURN) {
		switch(playerTurn()) {
			case MISS:
			if alarm[11] == -1 alarm[11] = 60;
				//turn = ENEMYTURN;
				//playerTurnCount++;
				//enemyAlreadyMove = false;
				//var log = "----------------------------------Enemy turn-------------------------------";
				//array_push(combatLog,log);
			break;
			case TURNOVER:
			if alarm[11] == -1 alarm[11] = 60;
				//turn = ENEMYTURN;
				//playerTurnCount++;
				//enemyAlreadyMove = false;
				//var log = "----------------------------------Enemy turn-------------------------------";
				//array_push(combatLog,log);
			break;
			case COMBATOVER:
				if alarm[9] == -1 alarm[9] = 60;
			var log = "Combat over..."+string(playerTurnCount)+" minutes passed";
			array_push(combatLog,log);
			break;
		}
	} else {
		switch(enemyTurn()) {
			case MISS:
				if alarm[10] == -1 alarm[10] = 60;
				//turn = PLAYERTURN;
				//playerOption = -1; 
				//getMenuInput = true;
				//playerAlreadyMove = false;
				//enemyTurnCount++;
				//var log = "----------------------------------Player turn-------------------------------";
				//array_push(combatLog,log);
			break;
			case TURNOVER:
				if alarm[10] == -1 alarm[10] = 60;
				//turn = PLAYERTURN;
				//playerOption = -1; 
				//getMenuInput = true;
				//playerAlreadyMove = false;
				//enemyTurnCount++;
				//var log = "----------------------------------Player turn-------------------------------";
				//array_push(combatLog,log);			
			break;
			case COMBATOVER:
				if alarm[9] == -1 alarm[9] = 60;
			var log = "Combat over..."+string(playerTurnCount)+" minutes passed";
			array_push(combatLog,log);
			break;
		}
	}
}


function playerTurn() {
	//var playerOption = get_integer("1-Attack\n2-DEFEND\n3-ITEM\n0-RUN",1);
	if (getMenuInput == false && playerAlreadyMove == false) {
		return battleOption(playerOption);
	}
}
function enemyTurn() {
	if (enemyAlreadyMove == false) {
			obj_Enemy.currentDefence = obj_Enemy.baseDefence;
			var enemyChoice = irandom_range(ATTACK,DEFEND);	
			switch(enemyChoice) {
				case ATTACK:
					enemyAlreadyMove = true;
					return	battleAttack(turn);
				break;
				case DEFEND:
					enemyAlreadyMove = true;
					return battleDefence(turn);
				break;
			}
	}
}



function battleDamage(target,damage) {
		if (target.currentLife - damage > 0) {
				target.currentLife -= damage;
				var log = (string(target.name)+" recive "+string(damage)+" damage.");
				array_push(combatLog,log);
				return TURNOVER;
		} else {
			target.currentLife -= damage;
			var log = (string(target.name)+" recive "+string(damage)+" damage.");
			array_push(combatLog,log);
			return COMBATOVER;
		}
}

function battleAttack(turn) {
	var defender = turn == PLAYERTURN ? obj_Enemy : obj_Player;
	var attacker = defender == obj_Player ? obj_Enemy : obj_Player;
	var diceResult = rollxdX(2,D6);
	var log = attacker.name + " attacks "+defender.name+": 2d6+"+string(attacker.currentAttack)+" = "+string(diceResult+attacker.currentAttack)+" vs "+string(defender.currentDefence);
	array_push(combatLog,log);
	if ((attacker.currentAttack + diceResult) > defender.currentDefence) {
		return battleDamage(defender,attacker.Damage);
	} else {
		var log = attacker.name + " Miss!";
		array_push(combatLog,log);
		return MISS;
	}
	
}

function battleInventory() {
	var invSize = array_length(obj_Player.Inventory);
	var drawItemHudX = 32;
	var drawItemHudY = 384;
	if (invSize > 0) {
		if (!instance_exists(obj_itemMenu)) {
			itemMenu = instance_create_layer(drawItemHudX,drawItemHudY,"Instances",obj_itemMenu);
			itemMenu.mySize = invSize-1;
		}
	} else {
		var log = "NO ITEMS IN THE INVETORY";
		array_push(combatLog,log);
		playerOption = -1; //Placeholder
		getMenuInput = true;
	}
}

function battleRun() {
	var diceResultPlayer = rollxdX(2,D6) + obj_Player.Level;
	var diceResultEnemy = rollxdX(2,D6) + obj_Enemy.Level;
	
	if (diceResultPlayer >= diceResultEnemy) {
		var log = "You ran away and did not receive any loot";
		array_push(combatLog,log);
		playerRun = 1;
		playerOption = -1; 
		return COMBATOVER;
	} else {
		var log ="You couldn't get away.";
		array_push(combatLog,log);
		playerOption = -1; 
		return TURNOVER;
	}
	
}
	
function battleDefence(turn) {
	var defender = turn == PLAYERTURN ? obj_Player : obj_Enemy ;
	var diceResult = rollxdX(2,D6);
	
	defender.currentDefence+=diceResult;
	var log = (string(defender.name)+" recive +"+string(diceResult)+" Defense until next turn. Current defense: "+string(defender.currentDefence));
	array_push(combatLog,log);
	return TURNOVER;
}
	
function battleOption(option) {

	switch(option) {
		case ATTACK:
			playerAlreadyMove = true;
			return battleAttack(turn);
		break;
		case DEFEND:
			playerAlreadyMove = true;
			return battleDefence(turn);
		break;
		case ITEM:
		return battleInventory();
		break;
		case RUN:
		return battleRun();
		break;
	}


}
	

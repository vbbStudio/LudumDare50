/// @description Functions and variables of a battle
// You can write your code in this editor
randomize();
scr_input();
turn = PLAYERTURN;
playerOption = -1; //Placeholder
getMenuInput = true;
drawInfos = true;
drawCombatLog = true;
enemyTurnCount = 0;
playerTurnCount = 0;

combatLog[0] = "Test 0";
combatLog[1] = "Test 1";
combatLog[2] = "Test 2";
combatLog[3] = "Test 3";
combatLog[4] = "Test 4";
combatLog[5] = "Test 5";
combatLog[6] = "Test 6";

function Battle(enemy) {
	drawInfos = true;
	if (turn == PLAYERTURN) {
		switch(playerTurn()) {
			case MISS:
				turn = ENEMYTURN;
				show_message("Player Miss, Turn Over");
				playerTurnCount++;
			break;
			case TURNOVER:
				turn = ENEMYTURN;
				show_message("Player Turn Over");
				playerTurnCount++;
			break;
			case COMBATOVER:
				show_message("Battle ends,Player Win");
			break;
		}
	} else {
		switch(enemyTurn()) {
			case MISS:
				turn = PLAYERTURN;
				getMenuInput = true;
				show_message("Enemy Miss, Turn Over");
				enemyTurnCount++;
			break;
			case TURNOVER:
				turn = PLAYERTURN;
				getMenuInput = true;
				show_message("Enemy Turn Over");
				enemyTurnCount++;
			break;
			case COMBATOVER:
				show_message("Battle ends,Enemy Win");
			break;
		}
	}
}


function playerTurn() {
	obj_Player.currentDefence = obj_Player.baseDefence;
	//var playerOption = get_integer("1-Attack\n2-DEFEND\n3-ITEM\n0-RUN",1);
	if (getMenuInput == false) {
		return battleOption(playerOption);
	}
}
function enemyTurn() {
	obj_Enemy.currentDefence = obj_Enemy.baseDefence;
	var enemyChoice = irandom_range(ATTACK,DEFEND);	
	switch(enemyChoice) {
		case ATTACK:
			return	battleAttack(turn);
		break;
		case DEFEND:
		return battleDefence(turn);
		break;
	}
}



function battleDamage(target,damage) {
		if (target.currentLife - damage > 0) {
				target.currentLife -= damage;
				show_message(string(target.name)+" recive "+string(damage)+" damage.");
				show_message(string(target.name)+" now have "+string(target.currentLife)+" points left");
				return TURNOVER;
		} else {
			return COMBATOVER;
		}
}

function battleAttack(turn) {
	var defender = turn == PLAYERTURN ? obj_Enemy : obj_Player;
	var attacker = defender == obj_Player ? obj_Enemy : obj_Player;
	var diceResult = rollxdX(2,D6);
	show_message(string(attacker.name)+" Attack: "+string(diceResult)+" + "+string(attacker.currentAttack)+" VS "+string(defender.name)+" Defense "+string(defender.currentDefence));
	if ((attacker.currentAttack + diceResult) > defender.currentDefence) {
		return battleDamage(defender,attacker.Damage);
	} else {
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
		show_message("No items to use");
		playerOption = -1; //Placeholder
		getMenuInput = true;
	}
}

function battleRun() {
	var diceResultPlayer = rollxdX(2,D6) + obj_Player.Level;
	var diceResultEnemy = rollxdX(2,D6) + obj_Enemy.Level;
	
	if (diceResultPlayer >= diceResultEnemy) {
		show_message("You ran away and did not receive any loot");
		return COMBATOVER;
	} else {
		show_message("You couldn't get away.");
		return TURNOVER;
	}
	
}
	
function battleDefence(turn) {
	var defender = turn == PLAYERTURN ? obj_Player : obj_Enemy ;
	var diceResult = rollxdX(2,D6);
	
	defender.currentDefence+=diceResult;
	show_message(string(defender.name)+" recive +"+string(diceResult)+" Defense until next turn.\nCurrent defense: "+string(defender.currentDefence));
	return TURNOVER;
}
	
function battleOption(option) {

	switch(option) {
		case ATTACK:
		return battleAttack(turn);
		break;
		case DEFEND:
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
	

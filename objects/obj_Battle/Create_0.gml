/// @description Functions and variables of a battle
// You can write your code in this editor
randomize();
turn = PLAYERTURN;
playerOption = -1; //Placeholder
getMenuInput = true;
function Battle(enemy) {
	if (turn == PLAYERTURN) {
		switch(playerTurn()) {
			case MISS:
				turn = ENEMYTURN;
				show_message("Player Miss, Turn Over");
			break;
			case TURNOVER:
				turn = ENEMYTURN;
				show_message("Player Turn Over");
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
			break;
			case TURNOVER:
				turn = PLAYERTURN;
				getMenuInput = true;
				show_message("Enemy Turn Over");
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
		break;
		case RUN:
		return battleRun();
		break;
	}


}
	

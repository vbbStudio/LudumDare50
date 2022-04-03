/// @description Player Turn
// You can write your code in this editor
turn = PLAYERTURN;
obj_Player.currentDefence = obj_Player.baseDefence+obj_Player.playerArmor;
obj_Player.currentAttack = obj_Player.baseAttack;
playerOption = -1; 
getMenuInput = true;
playerAlreadyMove = false;
enemyTurnCount++;
var log = "----------------------------------Player turn-------------------------------";
array_push(combatLog,log);
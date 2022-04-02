// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rollxdX(manyDices,diceNumber){
	finalResult = 0;
	repeat(manyDices) {
		finalResult	+= irandom_range(1,diceNumber);
	}
	return finalResult;
}
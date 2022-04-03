/// @description Insert description here
// You can write your code in this editor
draw_self();
var drawTextX = 35;
var drawTextY = 390;
draw_set_font(fnt_combatLog);
draw_text(drawTextX,drawTextY,"["+string(controller+1)+"/"+string(mySize+1)+"] "+itemName+"\n     "+itemDesc);


/// @description Magic Timbral
// You can write your code in this editor
event_perform(ev_create,0);
if (instance_exists(obj_Battle)) {
	instance_destroy(obj_Battle);
}

if (instance_exists(obj_Enemy)) {
	instance_destroy(obj_Enemy);
}
obj_Player.Coins = 0;
alarm[10] = 60;
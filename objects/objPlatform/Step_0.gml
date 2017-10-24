/// @description Insert description here
// You can write your code in this editor

if (instance_exists(objAmeliaV2))
{
	if (round(objAmeliaV2.y + (objAmeliaV2.sprite_height/2)) > y)  || (objAmeliaV2.key_down) mask_index = -1;
	else mask_index = sprPlatform;
}
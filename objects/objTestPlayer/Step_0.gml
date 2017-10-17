/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_left) hspeed = -5;
if keyboard_check_pressed(vk_right) hspeed = 5;
if keyboard_check_pressed(vk_up) vspeed = -5;
if keyboard_check_pressed(vk_down) vspeed = 5;

if keyboard_check_released(vk_left) hspeed = 0;
if keyboard_check_released(vk_right) hspeed = 0;
if keyboard_check_released(vk_up) vspeed = 0;
if keyboard_check_released(vk_down) vspeed = 0;
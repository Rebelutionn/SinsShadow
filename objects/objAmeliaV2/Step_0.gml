//Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);
key_attack = mouse_check_button_pressed(mb_left);
key_down = keyboard_check(ord("S"));

if (key_left) || (key_right)  ||  (key_jump)
{
controller = 0;
}

if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
{
key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
key_right = max(gamepad_axis_value(0, gp_axislh), 0);
controller = 1;
}

if(gamepad_button_check_pressed(0, gp_face1)) 
{ 
key_jump = 1; 
controller = 1;
}

if (gamepad_button_check(0, gp_face2))
	{
	key_attack = 1;
	controller = 1 ;
	sprite_index = sprSwordAtk; 
	image_index = -1;
	var xdiff = x - xprevious;

	if(!(xdiff = 0))
		{
		deltax = xdiff;
		}
	instance_create_layer(x+ sign(other.x),y+sign(other.y)*32,"Player",objSwordHitbox);
	if(image_index >= 7) && (gamepad_button_check_released(0, gp_face2))
		{
		image_speed = 0;
		sprite_index = sprAmeliaV2;
		} 

	}


//Calculate Movement
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

if (place_meeting (x,y+1,objCollision)) && (key_jump){
	vsp = -7.5;
}
              
	
//Horizontal Collision
if(place_meeting(x+hsp,y,objCollision)){
	while(!place_meeting(x+sign(hsp),y,objCollision)){
		x = x + sign(hsp); 
	}
	hsp = 0;
}
x = x + hsp;  


//Vertical Collision
if(place_meeting(x,y+vsp,objCollision)){
	while(!place_meeting (x,y+sign(vsp),objCollision)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Attack
if(mouse_check_button(mb_left))
{
	//audio_play_sound(sndSwordAttack, 1, false);
	sprite_index = sprSwordAtk;
	image_index = -1;
	var xdiff = x - xprevious;
	
	if(!(xdiff = 0))
	{
		deltax = xdiff;
	}
	instance_create_layer(x+ sign(other.x),y+sign(other.y)*32,"Player",objSwordHitbox);
	if(image_index >= 7) && (mouse_check_button_released(mb_left))
	{
		image_speed = 0;
		sprite_index = sprAmeliaV2;
	} 
	
}

/*if(mouse_check_button(mb_left)){
	sprite_index = sprSwordAtk;
	image_speed = 1;
	hsp = 0; 
	vsp = 0;	
	with(instance_activate_object(objSwordHitbox)){
		image_xscale = other.image_xscale;
		with(instance_place(x,y,objBat)){
			if(hit == 0){
				hit = 1;
				vspeed = -3; 
				hspeed = sign(x-other.x) + 4; 
				image_xscale = sign(hspBat);	
			}
		}
	}
}*/


//Grapple Check
if(mouse_check_button_pressed(mb_right)){
	instance_create_layer(x,y,"Player",objGrapple);
	mx = mouse_x;
	my = mouse_y; 
	if(place_meeting(mx,my,objGrappleBlock)){
		active = true;
	}
}
 
if(active){ 
	grv = 0.3; 
	x += (mx - x) = 1;
	y += (my - y) = 1;
	vsp = 0;
	hsp = hsp + 5;
}

if(mouse_check_button_released(mb_right)){
	active = false;
	grv = 0.3;
}

//Window Size
/*
// - Fullscreen
if ((keyboard_check (vk_alt)) && (keyboard_check_released (vk_enter)))
	{
	if window_get_fullscreen ()
		{
		window_set_fullscreen (false);
		}
	else
		{
		window_set_fullscreen (true);
		}
	}
*/
	
/*
// - Resolutions (360p, 720p, 1080p)
if (keyboard_check_released (vk_up))
	{
	if (windowHeight = 720)
		{
		windowWidth = 1920;
		windowHeight = 1980;
		}
	else if (windowHeight = 1080)
		{
		windowWidth = 640;
		windowHeight = 360;
		}
	else if (windowHeight = 360)
		{
		windowWidth = 1280;
		windowHeight = 720;
		}
	window_set_size (windowWidth, windowHeight);
	window_set_position ((monitorWidth / 2) - (windowWidth / 2), (monitorHeight / 2) - (windowHeight / 2));
	}
*/

if (x < iPrevFrameX)
	{
		image_xscale = -1;
	}
else if (x > iPrevFrameX)
	{
		image_xscale = 1;
	}
iPrevFrameX = x;

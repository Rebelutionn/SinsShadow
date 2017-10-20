/// @description Insert description here
// You can write your code in this editor
if (place_free(x,y+1)) gravity = 1;
else gravity = 0;



if(keyboard_check(ord("D"))){
hspeed = 4;
sprite_index = sprAmeliaSwing; 
}
if(keyboard_check(ord("A"))){
hspeed = -4;
sprite_index = sprAmeliaSwing;
}
if(!keyboard_check(ord("A"))) && !keyboard_check(ord("D")) hspeed = 0;

if(keyboard_check(vk_space) && !place_free(x,y+1)){
vspeed += -15;
sprite_index = sprAmeliaSwing;
}

//CHECKING HOOK       
if(mouse_check_button_pressed(mb_left)){
	mx = mouse_x;
	my = mouse_y;
	if(instance_exists(objBlockGrapple)){
		if(distance_to_object(objBlockGrapple) < iGrappleRadius){
			active = true;
			vspeed += -5;
			if(distance_to_object(objBlockGrapple) > iGrappleRadius){ 
				active = false;   
			}
		}        
	}                              
}
 
if(active == true){
	gravity = 0.1;
	x += (mx - x) = 0.5;
	y += (my - y) = 0.5;
}    

if(mouse_check_button_released(mb_left)){
active = false;
} 
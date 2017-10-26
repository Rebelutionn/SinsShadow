

if instance_exists(objAmeliaV2)
	{
	if distance_to_object(objAmeliaV2) < iBatDetectionRadius
		{
		bContinuePathOnce = 0;
		path_end();
		move_towards_point(objAmeliaV2.x, objAmeliaV2.y, 2);
		}
	else if bContinuePathOnce == 0
		{
		bContinuePathOnce = 1;
		path_start(pathEnemyBat, iBatSpeed, path_action_continue, 0);
		}
	}  

if(batHP <=0){					   
	instance_destroy();  
} 

hit = instance_place (x, y, objSwordHitbox);

if (hit != noone)
	{
	//hit.batHP -= 1; BREAKING GAME
	instance_destroy ();
	}
	
if (x < iPrevFrameX)
	{
		image_xscale = 1;
	}
else 
	{
		image_xscale = -1;
	}
iPrevFrameX = x;
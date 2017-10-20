// This makes the Bat move is the path where ever you choose to drop the Object.
hit = 0;
hspeed = 0;
vspeed = 0; 

batHP = 4; 

bBatDebugMode = 1;
bContinuePathOnce = 1;
iBatDetectionRadius = 100;
iBatSpeed = 2.25;
iBatDamage = 5;

path_start(pathEnemyBat1, iBatSpeed, path_action_restart, 0);
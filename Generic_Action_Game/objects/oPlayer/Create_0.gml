/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
accel = 0.5;
decel = 0.3;
regularSpd = 3;
jumpforce = 10;
maxFallSpeed = 8;
maxJumpForce = jumpforce;
spd = regularSpd;
grav = 0.5;
moveX = 0;
moveY = 0;
onGround = false;
precisionStep = 60;
hasControl= true;

#region aim
radius = 20; // Set your desired radius
#endregion 

#region hit
maxActiveFrames = 5;
activeFrames = 0;
maxHitCooldown = 12;
hitCooldown = 0;
#endregion

#region explode
explodeH = 10;
explodeV = 15;
explodeDownAngle = 1;
explodedBy = noone;
#endregion
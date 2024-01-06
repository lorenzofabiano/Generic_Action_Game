/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
accel = 0.5;
decel = 0.3;
regularSpd = 5;
spd = 5;
grav = 2;
moveX = 0;
moveY = 0;
onGround = false;
jumpforce = 32;
precisionStep = 60;
hasControl= true;

#region aim
radius = 50; // Set your desired radius
#endregion aim

#region hit
maxActiveFrames = 10;
activeFrames = 0;
maxHitCooldown = 20;
hitCooldown = 0;

#region explode
explodeH = 20;
explodeV = 50;
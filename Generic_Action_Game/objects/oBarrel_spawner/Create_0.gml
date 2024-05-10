/// @description Insert description here
// You can write your code in this editor
/*maxSpawnTime = 120;
spawnTime = maxSpawnTime;
spawnByPlayer = false;
fadeOut = 1;
fadeOutSpeed = .1;
fading = false;
unfadable = false;
returning = false;

if (!place_meeting(x,y,oWall)) && (!place_meeting(x,y,oBarrelParent)) unfadable = true;
*/
chargeTime = 120; //time it takes to charge a barrel 
charging = true;
charged = false;
charge = 0;
chargeSpeed = 1/chargeTime;
cosoGiallo = noone;
spawnByPlayer = false;
fadeOut = 1;
fadeOutSpeed = .05;
fading = false;
unfadable = false;
returning = false;



if (!place_meeting(x,y,oWall)) && (!place_meeting(x,y,oBarrelParent)) unfadable = true;
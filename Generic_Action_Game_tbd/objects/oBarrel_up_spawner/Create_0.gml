/// @description Insert description here
// You can write your code in this editor
maxSpawnTime = 120;
spawnTime = maxSpawnTime;
spawnByPlayer = false;
fadeOut = 1;
fadeOutSpeed = .05;
fading = false;
unfadable = false;

if (!place_meeting(x,y,oWall)) && (!place_meeting(x,y,oBarrelParent)) unfadable = true;
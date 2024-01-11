/// @description Insert description here
// You can write your code in this editor
if (!place_meeting(x,y,oBarrel_up)) spawnTime--;
if (spawnTime <= 0) {
	instance_create_layer(x,y,"Barrels",oBarrel_up);
	spawnTime = maxSpawnTime;
}




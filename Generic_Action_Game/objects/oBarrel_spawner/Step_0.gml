if (!place_meeting(x,y,oBarrel)) spawnTime--;
if (spawnTime <= 0) {
	instance_create_layer(x,y,"Barrels",oBarrel);
	spawnTime = maxSpawnTime;
}
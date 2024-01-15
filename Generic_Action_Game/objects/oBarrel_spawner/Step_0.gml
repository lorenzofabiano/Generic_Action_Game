if (!place_meeting(x,y,oBarrel)) spawnTime--;
if (spawnTime <= 0) {
	with (instance_create_layer(x,y,"Barrels",oBarrel)) spawnByPlayer = other.spawnByPlayer;
	// instance_create_layer(x,y,"Barrels",oBarrel);
	spawnTime = maxSpawnTime;
}

if ((place_meeting(x,y,oWall)) || (place_meeting(x,y,oBarrelParent))) && (!unfadable) fading = true;

if (fading) {
	fadeOut = max(0, fadeOut - fadeOutSpeed);
	if (fadeOut == 0) {
		global.bAmmo++;
		instance_destroy();
	}
	image_alpha = fadeOut;
}

if (returning) {
	with (instance_create_layer(x,y,"other",oBarrelRecover)) {
		thisWas = "barrel";
	}
	with (instance_place(x,y,oBarrel)) instance_destroy();
	instance_destroy();
}
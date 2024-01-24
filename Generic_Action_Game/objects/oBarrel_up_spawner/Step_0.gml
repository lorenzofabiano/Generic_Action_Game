/// @description Insert description here
// You can write your code in this editor
//if (!place_meeting(x,y,oBarrel_up)) spawnTime--;
//if (spawnTime <= 0) {
if (!place_meeting(x,y,oBarrel_up)) && (unfadable) {
	with (instance_create_layer(x,y,"Barrels",oBarrel_up)) spawnByPlayer = other.spawnByPlayer;
	//spawnTime = maxSpawnTime;
}

if ((place_meeting(x,y,oWall)) || (place_meeting(x,y,oBarrelParent))) && (!unfadable) fading = true;

if (fading) {
	fadeOut = max(0, fadeOut - fadeOutSpeed);
	if (fadeOut == 0) {
		global.bUpAmmo++;
		instance_destroy();
	}
	image_alpha = fadeOut;
}

if (returning) {
	with (instance_create_layer(x,y,"other",oBarrelRecover)) {
		thisWas = "upBarrel";
	}
	with (instance_place(x,y,oBarrel_up)) instance_destroy();
	instance_destroy();
}

//show_debug_message(instance_place(x,y,oBarrel_up));
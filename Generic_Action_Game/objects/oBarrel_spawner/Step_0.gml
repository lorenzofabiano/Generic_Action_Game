//if (!place_meeting(x,y,oBarrel)) spawnTime--;
/*if (!place_meeting(x,y,oBarrel)) && (unfadable) {
	with (instance_create_layer(x,y,"Barrels",oBarrel)) spawnByPlayer = other.spawnByPlayer;
	// instance_create_layer(x,y,"Barrels",oBarrel);
	//spawnTime = maxSpawnTime;
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
}*/

/// @description Insert description here
// You can write your code in this editor
//if (!place_meeting(x,y,oBarrel_up)) spawnTime--;
//if (spawnTime <= 0) {

if (charging) && (unfadable) {
	
	if (cosoGiallo == noone) {
		cosoGiallo = instance_create_layer(x,y,"Barrels",oBarrel);
	} 
	else {
		with (cosoGiallo) image_yscale = other.charge;
		
	}
			
	clamp(charge,0,1);
	charge += chargeSpeed;
	
	if (charge == 1) {
		instance_create_layer(x,y,"other",oBarrelCharged);
		charging = false;
		charged = true;
	}
	
}

if (charged) {
	if place_meeting(x,y,oAimBig) {
		//instance_create_layer(x, y + 25,"other",oExplosionHitbox_dr);
		//instance_create_layer(x - 1, y +25,"other",oExplosionHitbox_dl);
		instance_create_layer(x,y,"other",oExplosionHitbox_dr);
		instance_create_layer(x - 1,y,"other",oExplosionHitbox_dl);
		//instance_create_layer(x,y,"other",oExplosionHitbox_r);
		//instance_create_layer(x - 1, y,"other",oExplosionHitbox_l);
		instance_create_layer(x,y - 1,"other",oExplosionHitbox_ur);
		instance_create_layer(x - 1,y - 1,"other",oExplosionHitbox_ul);
		scScreenShake(10,20);
		instance_destroy(cosoGiallo);
		cosoGiallo = noone;
		charge = 0;
		charging = true;
		charged = false;
	}
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
	instance_destroy(cosoGiallo);
	cosoGiallo = noone;
	instance_destroy();
}

//show_debug_message(cosoGiallo);

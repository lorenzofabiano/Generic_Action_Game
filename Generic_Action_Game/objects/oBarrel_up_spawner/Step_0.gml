/// @description Insert description here
// You can write your code in this editor
//if (!place_meeting(x,y,oBarrel_up)) spawnTime--;
//if (spawnTime <= 0) {

if (charging) && (unfadable) {
	
	if (cosoGiallo == noone) {
		cosoGiallo = instance_create_layer(x,y,"Barrels",oBarrel_up);
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
	if (place_meeting(x,y,oAimBig)) {
		instance_create_layer(x,y - 10,"other",oExplosionHitbox_u);
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
		global.bUpAmmo++;
		instance_destroy();
	}
	image_alpha = fadeOut;
}

if (returning) {
	with (instance_create_layer(x,y,"other",oBarrelRecover)) {
		thisWas = "upBarrel";
	}
	instance_destroy(cosoGiallo);
	cosoGiallo = noone;
	instance_destroy();
}

//show_debug_message(cosoGiallo);

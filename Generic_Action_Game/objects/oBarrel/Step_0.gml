/// @description Insert description here
// You can write your code in this editor

/*
if (charging) {
	charge = min(charge+chargeSpeed,chargeMax);
	if (charge == chargeMax) {
		instance_create_layer(x,y,"other",oBarrelCharged);
		charging = false;
	}
}

//image_xscale = charge;
image_yscale = charge;

if (!charging) {
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
		instance_destroy();
	}
}

//toppa demmerda per un comportamento che non riesco a controllare de sto gioco demmerda.
//quando spawno uno spawner, lo spawner spawna due hitbox rimbalzelle perché nei 2 step
//in cui le hitbox rimbalzelle si stanno caricando, hanno una collision mask invisibile e quindi
//secondo gli spawner non esistono, ergo gli spawner ne spawnano un altra.
//se succede, le hitbox rimbalzelle si detectano e si uccidono a vicenda. L'ultima che rimane vince.
with (instance_place(x,y,oBarrel)) instance_destroy(); 
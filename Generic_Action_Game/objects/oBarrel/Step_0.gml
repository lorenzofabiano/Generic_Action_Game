/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,oAim) {
	//instance_create_layer(x, y + 25,"other",oExplosionHitbox_dr);
	//instance_create_layer(x - 1, y +25,"other",oExplosionHitbox_dl);
	instance_create_layer(x,y,"other",oExplosionHitbox_dr);
	instance_create_layer(x - 1,y,"other",oExplosionHitbox_dl);
	//instance_create_layer(x,y,"other",oExplosionHitbox_r);
	//instance_create_layer(x - 1, y,"other",oExplosionHitbox_l);
	instance_create_layer(x,y - 1,"other",oExplosionHitbox_ur);
	instance_create_layer(x - 1,y - 1,"other",oExplosionHitbox_ul);
	instance_destroy();
}
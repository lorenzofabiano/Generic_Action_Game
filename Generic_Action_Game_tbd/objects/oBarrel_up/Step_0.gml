/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,oAimBig)) {
	instance_create_layer(x,y - 10,"other",oExplosionHitbox_u);
	scScreenShake(10,20);
	instance_destroy();
}






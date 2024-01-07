/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x,y,oAim)) or (place_meeting(x,y,oOmino)) {
	instance_create_layer(x,y - 10,"other",oExplosionHitbox_u);
	instance_destroy();
}
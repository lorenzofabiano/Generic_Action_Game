/// @description Insert description here
// You can write your code in this editor 



if (instance_exists(oPlayer) && oPlayer.hasControl) {
	var zooming = keyboard_check(vk_shift) || gamepad_button_check(0,gp_shoulderlb);
	if (zooming  && canZoom) {
		currentZoom = min(currentZoom + zoomSpeed, maxZoom);
		distanceFromFollow = min(distanceFromFollow + sideMovingSpeed,maxDistanceFromFollow);
		follow = oNextRoom;
	}
	else {
		currentZoom = max(currentZoom - zoomSpeed, minZoom);
		distanceFromFollow = max(distanceFromFollow - sideMovingSpeed,minDistanceFromFollow);
		follow = oPlayer;
	
	}
}

image_xscale=currentZoom;
image_yscale=currentZoom;



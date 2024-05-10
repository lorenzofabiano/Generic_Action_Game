/// @description Insert description here
// You can write your code in this editor 
var zooming = keyboard_check(vk_shift) || gamepad_button_check(0,gp_shoulderlb);


if (instance_exists(oPlayer)) {
	if oPlayer.hasControl {
		if zooming {
			currentZoom = min(currentZoom + zoomSpeed, maxZoom);
			distanceFromFollow = min(distanceFromFollow + sideMovingSpeed,maxDistanceFromFollow);
		}
		else {
			currentZoom = max(currentZoom - zoomSpeed, minZoom);
			distanceFromFollow = max(distanceFromFollow - sideMovingSpeed,minDistanceFromFollow);
			
		}
	}
	
}

image_xscale=currentZoom;
image_yscale=currentZoom;



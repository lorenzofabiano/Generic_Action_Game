/// @description Insert description here
// You can write your code in this editor

if (hudDuration > 0 ) {
	scalingHud = clamp(scalingHud + scalingSpeed,0,1);
	hudDuration = clamp(hudDuration - 1, 0, hudDurationMax);
	

} 

if (hudDuration == 0) {
	scalingHud = clamp(scalingHud - scalingSpeed,0,1);
	if (scalingHud == 0) instance_destroy();
}



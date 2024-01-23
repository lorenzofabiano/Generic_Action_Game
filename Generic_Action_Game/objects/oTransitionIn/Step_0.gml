/// @description Insert description here
// You can write your code in this editor
if (goingUp) {
	oCamera.follow = oStart;
	//oCamera.yTo = cameraGoDownPosY;
	
	cameraMovingUpTime = max(0,cameraMovingUpTime - 1);
	if (cameraMovingUpTime == 0) {
		goingUp = false;
	}
}
else {
	if (instance_exists(oPlayer)) {
		oCamera.follow = oPlayer;
		oCamera.confine = true;
		instance_destroy();
	}
}






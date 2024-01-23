/// @description Insert description here
// You can write your code in this editor
if (goingDown) {
	oCamera.follow = oNextRoom;
	//oCamera.yTo = cameraGoDownPosY;
	
	cameraMovingDownTime = max(0,cameraMovingDownTime - 1);
	if (cameraMovingDownTime == 0) {
		goingDown = false;
		oCamera.follow = noone;
	}
}
else {
	cameraGoUpPosX=oCamera.x;
	oCamera.xTo = cameraGoUpPosX;
	oCamera.yTo = cameraGoUpPosY;
	
	cameraMovingUpTime = max(0,cameraMovingUpTime - 1);
	if (cameraMovingUpTime == 0) room_goto_next();
}






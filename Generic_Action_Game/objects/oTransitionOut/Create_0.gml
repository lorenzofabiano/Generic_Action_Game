/// @description Insert description here
// You can write your code in this editor
oCamera.confine = false;
oCamera.zoomingBack = false;

goingDown = true;
goingUp = false;

cameraMovingDownTime=30;
cameraMovingUpTime=30;
cameraGoDownDist=100;
cameraGoDownPosX=oCamera.x + cameraGoDownDist;
cameraGoDownPosY=oCamera.y + cameraGoDownDist;
cameraGoUpPosY=0;
cameraGoUpPosX=oCamera.x;

w = display_get_gui_width();
h = display_get_gui_height();
fadeSpeed=1/(cameraMovingUpTime/2);
fade=0;





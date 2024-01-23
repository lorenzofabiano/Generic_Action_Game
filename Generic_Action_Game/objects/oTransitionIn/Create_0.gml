/// @description Insert description here
// You can write your code in this editor
oCamera.confine = false;
oCamera.zoomingBack = false;



//goingDown = true;
goingUp = true;

cameraMovingUpTime=30;


w = display_get_gui_width();
h = display_get_gui_height();
fadeSpeed=1/cameraMovingUpTime;
fade=1;


if (instance_exists(oStart)) oCamera.x=oStart.x else oCamera.x = room_width/2;
oCamera.y = room_height;


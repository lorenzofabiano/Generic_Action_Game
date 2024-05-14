/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
cam = view_camera[0];
follow = oPlayer;
view_w_half = oResManager.view_width/2;
view_h_half = oResManager.view_height/2;
//buff = 32;
buff = 16;
shake_remain = 0;
shake_length = 0;
shake_magnitude = 0;
camera_follow_speed = 10; //lower is faster
xTo = xstart;
yTo = ystart;
zoomingBack = false;
confine = false;

//camera zoom

//view_min_zoom = 1;
//view_max_zoom = 2;
zoom_speed = 0.05;
view_min_zoom = .5 * global.rendererMultiplier;
view_max_zoom = 1 * global.rendererMultiplier;
view_zoom = view_max_zoom;
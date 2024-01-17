/// @description Insert description here
// You can write your code in this editor

var zoom_speed = 0.05;
//view_zoom += keyboard_check(vk_up) * zoom_speed;
//view_zoom -= keyboard_check(vk_down) * zoom_speed;

//view_zoom = clamp(view_zoom,view_min_zoom,view_max_zoom);
//view_zoom = (max(view_min_zoom,view_zoom))
//view_zoom = clamp(view_zoom,view_min_zoom,view_max_zoom);
if (zoomingBack) view_zoom = max(view_min_zoom,view_zoom - zoom_speed); else view_zoom = min(view_zoom + zoom_speed, view_max_zoom);
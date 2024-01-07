/// @description Insert description here
// You can write your code in this editor
var zoom_speed = .2;
view_zoom += keyboard_check(vk_up) * zoom_speed;
view_zoom -= keyboard_check(vk_down) * zoom_speed;

view_zoom = clamp(view_zoom,1,view_max_zoom);




/// @description Insert description here
// You can write your code in this editor

#macro cam view_camera[0]
#macro view_w camera_get_view_width(view_camera[0])
#macro view_h camera_get_view_height(view_camera[0])
aspect_ratio = 16/9;
global.rendererMultiplier = 2;

//view_height=360;
view_height=360 * global.rendererMultiplier;
view_width=view_height*aspect_ratio;



max_window_scale = min(floor(display_get_width()/view_width),floor(display_get_height()/view_height));

if view_height * max_window_scale == display_get_height() max_window_scale--;

window_scale = max_window_scale;

window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0]=1;


surface_resize(application_surface,view_width*window_scale,view_height*window_scale);
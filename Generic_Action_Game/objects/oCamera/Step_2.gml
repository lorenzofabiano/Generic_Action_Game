/// @description Insert description here
// You can write your code in this editor
// You can write your code in this editor

/*if instance_exists(Player) {
	var cam_x = Player.x - (oResManager.view_width/view_zoom)/2;
	var cam_y = Player.y - (oResManager.view_height/view_zoom)/2;
	camera_set_view_pos(cam,cam_x,cam_y);
	
}*/

/// @description Update Camera

//update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
		/*if (follow == oPlayer_dead) {
			x = xTo;
			y = yTo;
		}*/
}

//Update object position

x += (xTo - x) / camera_follow_speed;
y += (yTo - y) / camera_follow_speed;

//Don't let the camera see over the room confines
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//Screen shake
x += random_range(-shake_remain,shake_remain)
y += random_range(-shake_remain,shake_remain)
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));


//Update actual camera position
camera_set_view_size(cam,oResManager.view_width/view_zoom,oResManager.view_height/view_zoom);
camera_set_view_pos(cam,x-view_w_half/view_zoom,y-view_h_half/view_zoom);

//parallax effect
/*
if (layer_exists("Background")) {
	layer_x("Background",x/2);	
}

if (layer_exists("Background")) {
	layer_x("Background",x/5);	
}*/




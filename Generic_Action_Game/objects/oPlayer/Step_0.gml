/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


//many thanks to https://www.reddit.com/r/gamemaker/comments/5my5jr/deductadd_onto_the_value_until_the_value_is_zero/
if (hasControl) {

	var move_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	var move_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	var jump = keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space);
	move = move_right - move_left;


	if (jump && onGround) {
	    moveY -= jumpforce;
	    onGround = false;
	}

}

if (move == 0)  {
	 var ht = moveX;
	 if moveX != 0 {
	     moveX -= sign(moveX) * decel;
	     if sign(ht) != sign(moveX) moveX = 0;
	 }
 }

moveX = clamp(moveX + accel * move, -spd, spd);
moveY += grav;

repeat(precisionStep) {
    var xStep = moveX / precisionStep;
    var yStep = moveY / precisionStep;

    if (place_meeting(x + xStep, y, oWall)) {
        moveX = 0;
    } else {
        x += xStep;
    }


    if (moveY > 0) {

        if (place_meeting(x, y + yStep, oWall)) {
            onGround = true;
            moveY = 0;
        } else {
            y += yStep;
			onGround = false;
        }
    } else {
		if (place_meeting(x, y + yStep, oWall)) {
            moveY = 0;
        } else {
            y += yStep;
        }

      }




}

#region aim

var angle = point_direction(x, y, mouse_x, mouse_y);

// Calculate the x and y coordinates of the point on the circle
circle_x = x + lengthdir_x(radius, angle);
circle_y = y + lengthdir_y(radius, angle);

#endregion aim

#region attack
if (mouse_check_button_pressed(mb_left) and hitCooldown == 0) {
	instance_create_layer(circle_x,circle_y,"other",oAim);
	activeFrames = maxActiveFrames;
	hitCooldown = maxHitCooldown;
}
activeFrames--
activeFrames = clamp(activeFrames--,0,maxActiveFrames);

if (activeFrames == 0) and (instance_exists(oAim)) {
	instance_destroy(oAim);
}
hitCooldown--
hitCooldown = clamp(hitCooldown--,0,maxHitCooldown);

#endregion attack

#region explode
if (instance_exists(oExplosionHitbox)) {
	if (point_in_rectangle(x,y,oExplosionHitbox_dl.bbox_left,oExplosionHitbox_dl.bbox_top,oExplosionHitbox_dl.bbox_right,oExplosionHitbox_dl.bbox_bottom)) {
		hasControl = false;
		move = 0;
		spd = 999;
		moveX = -explodeH;
		moveY = explodeV; 
	}

	if (point_in_rectangle(x,y,oExplosionHitbox_dr.bbox_left,oExplosionHitbox_dr.bbox_top,oExplosionHitbox_dr.bbox_right,oExplosionHitbox_dr.bbox_bottom)) {
		hasControl = false;
		move = 0;
		spd = 999;
		moveX = explodeH;
		moveY = explodeV; 
	}

	if (point_in_rectangle(x,y,oExplosionHitbox_l.bbox_left,oExplosionHitbox_l.bbox_top,oExplosionHitbox_l.bbox_right,oExplosionHitbox_l.bbox_bottom)) {
		hasControl = false;
		move = 0;
		spd = 999;
		moveX = -explodeH;
		//moveY += explodeV; 
	}
	if (point_in_rectangle(x,y,oExplosionHitbox_r.bbox_left,oExplosionHitbox_r.bbox_top,oExplosionHitbox_r.bbox_right,oExplosionHitbox_r.bbox_bottom)) {
		hasControl = false;
		move = 0;
		spd = 999;
		moveX = explodeH;
		//moveY += explodeV; 
	}
	if (point_in_rectangle(x,y,oExplosionHitbox_ul.bbox_left,oExplosionHitbox_ul.bbox_top,oExplosionHitbox_ul.bbox_right,oExplosionHitbox_ul.bbox_bottom)) {
		hasControl = false;
		move = 0;
		spd = 999;
		moveX = -explodeH;
		moveY -= explodeV; 
	}
	if (point_in_rectangle(x,y,oExplosionHitbox_ur.bbox_left,oExplosionHitbox_ur.bbox_top,oExplosionHitbox_ur.bbox_right,oExplosionHitbox_ur.bbox_bottom)) {
		hasControl = false;
		move = 0;
		spd = 999;
		moveX = explodeH;
		moveY -= explodeV; 
	}
}

if (moveX == 0) and (hasControl == false) {
	spd = regularSpd;
	hasControl = true;
}
#endregion explode

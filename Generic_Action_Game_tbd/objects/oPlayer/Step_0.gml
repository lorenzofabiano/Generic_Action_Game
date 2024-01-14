/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor


//many thanks to https://www.reddit.com/r/gamemaker/comments/5my5jr/deductadd_onto_the_value_until_the_value_is_zero/
if (hasControl) {


#region get axis values
	if (gamepad_axis_value(0,gp_axislh) > deadZone) {
		stick_move_right = true;
		stick_move_left = false;
	} else if (gamepad_axis_value(0,gp_axislh) < -deadZone) {
		stick_move_left = true;
		stick_move_right = false;
	} else {
		stick_move_right = false;
		stick_move_left = false;
	}
	
	if (gamepad_axis_value(0,gp_axislv) > deadZone) {
		stick_move_down = true;
		stick_move_up = false;
	} else if (gamepad_axis_value(0,gp_axislv) < -deadZone) {
		stick_move_up = true;
		stick_move_down = false;

	} else {
		stick_move_up = false;
		stick_move_down = false;
	}
#endregion

	var move_right = keyboard_check(ord("D")) || gamepad_button_check(0,gp_padr) || stick_move_right;
	var move_left = keyboard_check(ord("A")) || gamepad_button_check(0,gp_padl) || stick_move_left;
	var jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
	var lookUp = keyboard_check(ord("W")) || gamepad_button_check(0,gp_padu) || stick_move_up;
	var lookDown = keyboard_check(ord("S")) || gamepad_button_check(0,gp_padd) || stick_move_down;
	var spawnBarrel = keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0,gp_face4);
	var spawnUpBarrel = keyboard_check_pressed(ord("Q")) || gamepad_button_check_pressed(0,gp_face2);
	var recoverBarrel = keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(0,gp_shoulderrb);
	var attack = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0,gp_face3);
	var zoomBack = keyboard_check(vk_shift) || gamepad_button_check(0,gp_shoulderlb);
	
	
	
	var look = lookUp - lookDown;
	var move = move_right - move_left;


	if (jump && onGround) {
	    moveY -= jumpforce;
	    onGround = false;
	}
	
	if (spawnBarrel) && (global.bAmmo > 0) {
		with (instance_create_layer(x,y + 40,"Spawner",oBarrel_spawner)) spawnByPlayer = true;
		global.bAmmo--;
	}
	
	if (spawnUpBarrel) && (global.bUpAmmo > 0) {
		with (instance_create_layer(x,y,"Spawner",oBarrel_up_spawner)) spawnByPlayer = true;
		global.bUpAmmo--;
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
moveY = clamp(moveY, -maxJumpForce, maxFallSpeed);


#region animation
if (moveX != 0) && (onGround) && (explodedBy == noone) {
	sprite_index = sPlayer_run;
	image_xscale = sign(moveX);
} 

if (explodedBy == oExplosionHitbox_u) sprite_index = sPlayer_vertical_jump;

if (explodedBy == oExplosionHitbox6) && (moveX != 0) {
	sprite_index = sPlayer_diagonal_jump;
	image_xscale = sign(moveX);
}

if (onGround) && (moveX == 0) && (explodedBy == noone) sprite_index = sPlayer;
#endregion


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

var angle = point_direction(x, y,x + radius, mouse_y);

// Calculate the x and y coordinates of the point on the circle
circle_x = x + lengthdir_x(radius, angle);
circle_y = y + lengthdir_y(radius, angle);

#endregion aim

#region attack
if (attack) and (hitCooldown == 0) {
	//instance_create_layer(circle_x,circle_y,"other",oAim);
	instance_create_layer(x,y,"other",oAimBig);
	activeFrames = maxActiveFrames;
	hitCooldown = maxHitCooldown;
}
activeFrames--
activeFrames = clamp(activeFrames,0,maxActiveFrames);

if (activeFrames == 0) and (instance_exists(oAimBig)) {
	instance_destroy(oAimBig);
}
hitCooldown--
hitCooldown = clamp(hitCooldown,0,maxHitCooldown);

#endregion attack

#region explode
if (instance_exists(oExplosionHitbox_dl) && instance_exists(oExplosionHitbox_dr) && /*instance_exists(oExplosionHitbox_r) && instance_exists(oExplosionHitbox_l) && */instance_exists(oExplosionHitbox_ur) && instance_exists(oExplosionHitbox_ul)) {
	if (point_in_rectangle(x,y,oExplosionHitbox_dl.bbox_left,oExplosionHitbox_dl.bbox_top,oExplosionHitbox_dl.bbox_right,oExplosionHitbox_dl.bbox_bottom)) {
	//if (place_meeting(x,y,oExplosionHitbox_dl)) {
		//hasControl = false;
		move = 0;
		spd = 5;
		decel = .1;
		moveX = -explodeH;
		moveY = explodeDownAngle;
		explodedBy = oExplosionHitbox6;
		explodeTime = explodeMaxTime;
		
	}
	if (point_in_rectangle(x,y,oExplosionHitbox_dr.bbox_left,oExplosionHitbox_dr.bbox_top,oExplosionHitbox_dr.bbox_right,oExplosionHitbox_dr.bbox_bottom)) {
	//if (place_meeting(x,y,oExplosionHitbox_dr)) {
		//hasControl = false;
		move = 0;
		spd = 5;
		decel = .1;
		moveX = explodeH;
		moveY = explodeDownAngle;
		explodedBy = oExplosionHitbox6;
		explodeTime = explodeMaxTime;
	}

	if (point_in_rectangle(x,y,oExplosionHitbox_ul.bbox_left,oExplosionHitbox_ul.bbox_top,oExplosionHitbox_ul.bbox_right,oExplosionHitbox_ul.bbox_bottom)) {
	//if (place_meeting(x,y,oExplosionHitbox_ul)) {
		//hasControl = false;
		move = 0;
		spd = 5;
		decel = .1;
		moveX = -explodeH;
		moveY = -jumpforce;
		explodedBy = oExplosionHitbox6;
		explodeTime = explodeMaxTime;
	}
	if (point_in_rectangle(x,y,oExplosionHitbox_ur.bbox_left,oExplosionHitbox_ur.bbox_top,oExplosionHitbox_ur.bbox_right,oExplosionHitbox_ur.bbox_bottom)) {
	//if (place_meeting(x,y,oExplosionHitbox_ur)) {
		//hasControl = false;
		move = 0;
		spd = 5;
		decel = .1;
		moveX = explodeH;
		moveY = -jumpforce;
		explodedBy = oExplosionHitbox6;
		explodeTime = explodeMaxTime;
	}
}
if (instance_exists(oExplosionHitbox_u)) {
	//if (point_in_rectangle(x,y,oExplosionHitbox_u.bbox_left,oExplosionHitbox_u.bbox_top,oExplosionHitbox_u.bbox_right,oExplosionHitbox_u.bbox_bottom)) {
	if (place_meeting(x,y,oExplosionHitbox_u)) {
		//hasControl = false;
		move = 0;
		moveX = 0;
		//moveY = 0;
		maxJumpForce = explodeV;
		moveY = -explodeV;
		explodedBy = oExplosionHitbox_u;
		explodeTime = explodeMaxTime;
	}		
}

//if (moveY == 0) and (hasControl == false) and (explodedBy == oExplosionHitbox_u) {
if  (explodeTime == 0) and (explodedBy == oExplosionHitbox_u) {
	spd = regularSpd;
	maxJumpForce = jumpforce;
	hasControl = true;
	explodedBy = noone;
	decel = regularDecel;
}

//if (moveX == 0) and (hasControl == false) and (explodedBy == oExplosionHitbox6) {
if  (explodeTime == 0) and (explodedBy == oExplosionHitbox6) {
	maxJumpForce = jumpforce;
	spd = regularSpd;
	hasControl = true;
	explodedBy = noone;
	decel = regularDecel;
}

if (explodedBy == oExplosionHitbox6) && (!instance_exists(oExplodeAura)) {
	instance_create_layer(x,y,"other",oExplodeAura); 
}
else if (explodedBy == noone) && (instance_exists(oExplodeAura)) {
	instance_destroy(oExplodeAura);
}
	
explodeTime--
explodeTime = clamp(explodeTime, 0, explodeMaxTime);

#endregion 

#region trail
if (explodedBy != noone) instance_create_layer(x,y,"Trail",oTrail);
#endregion

#region look

#region lookup
if (lookUp) && (!lookDown) {
	if (!instance_exists(oLookUp)) instance_create_layer(x,y,"other",oLookUp);
	oCamera.follow = oLookUp; 
}
else {  
	if (instance_exists(oLookUp)) && (oCamera.follow == oLookUp) {
		oCamera.follow = oPlayer;
		instance_destroy(oLookUp);
	}
}
#endregion

#region lookdown
if (lookDown) && (!lookUp) {
	if (!instance_exists(oLookDown)) instance_create_layer(x,y,"other",oLookDown);
	oCamera.follow = oLookDown; 
}
else {  
	if (instance_exists(oLookDown)) && (oCamera.follow == oLookDown) {
		oCamera.follow = oPlayer;
		instance_destroy(oLookDown);
	}
}

#endregion

#endregion look

#region recover
var onRecoveryWall = place_meeting(x,y+1,oRecoveryWall);

if (onRecoveryWall) && (recoverBarrel) {
	with (oBarrelParent) {
		if (spawnByPlayer) instance_destroy();
	}
	global.bUpAmmo = global.StartBUpAmmo;
	global.bAmmo = global.StartBAmmo;
}

#endregion

#region ufo
if (!instance_exists(oUfo)) instance_create_layer(x,y,"Trail",oUfo);
#endregion

#region zoom back
if (zoomBack) oCamera.zoomingBack = true; else oCamera.zoomingBack = false;
/// @description Insert description here
// You can write your code in this editor
if (hasMovement) move = 1;
if (place_meeting(x,y,oWall)) move = move * -1;

moveX = spd * move;
moveY += grav;
moveY = clamp(moveY, -maxJumpForce, maxFallSpeed);

repeat(precisionStep) {
    var xStep = moveX / precisionStep;
    var yStep = moveY / precisionStep;

    if (place_meeting(x + xStep, y, oWall)) {
        moveX = 0;
		//move = move * -1;
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


if (instance_exists(oExplosionHitbox_u)) {
	//if (point_in_rectangle(x,y,oExplosionHitbox_u.bbox_left,oExplosionHitbox_u.bbox_top,oExplosionHitbox_u.bbox_right,oExplosionHitbox_u.bbox_bottom)) {
	if (place_meeting(x,y,oExplosionHitbox_u)) {
		hasMovement = false;
		move = 0;
		moveX = 0;
		//moveY = 0;
		maxJumpForce = explodeV;
		moveY = -explodeV;
		explodedBy = oExplosionHitbox_u;
	}		
}

if (moveY == 0) and (hasMovement == false) && (explodedBy == oExplosionHitbox_u) {
	hasMovement = true;
	maxJumpForce = jumpforce;
	hasControl = true;
	explodedBy = noone;
}

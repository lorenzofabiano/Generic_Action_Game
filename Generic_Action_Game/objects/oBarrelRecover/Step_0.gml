/// @description Insert description here
// You can write your code in this editor
if (spawning) {
	if (jump) {
		moveY -= jumpForce;
		jump = false;
	}
	
	moveY += grav;
	y += moveY;
	
	
	transitionTime = max(0,transitionTime-1);
	
	if (transitionTime == 0) {
		spawning = false;
		returning = true;
	}
	
}

if (returning) {
	if (instance_exists(follow)) {
		xTo = follow.x //- distanceFromFollow;
		yTo = follow.y //- distanceFromFollow;

		}
	instance_create_layer(x,y,"Trail",oTrailFull);

	x += (xTo - x) / barrelFollowSpeed;
	y += (yTo - y) / barrelFollowSpeed;
	
	shrinkSize = clamp(shrinkSize,0.3,shrinkMaxSize);
	shrinkSize -= shrinkSpeed;
	
	image_xscale = shrinkSize;
	image_yscale = shrinkSize;
		
		
}


if (place_meeting(x,y,oPlayer)) {
	if (thisWas == "barrel") global.bAmmo++;
	else if (thisWas == "upBarrel") global.bUpAmmo++;
	instance_destroy()
}



if (instance_exists(follow)) {
	xTo = follow.x - distanceFromFollow;
	yTo = follow.y - distanceFromFollow;
		/*if (follow == oPlayer_dead) {
			x = xTo;
			y = yTo;
		}*/
}

//Update object position

x += (xTo - x) / ufoFollowSpeed;
y += (yTo - y) / ufoFollowSpeed;
/// @description Core Logic

self.x += hSpd;
self.y += vSpd;

if (self.activeFrames < 130)
{
	self.activeFrames++;	
}
else 
{
	instance_destroy(self);
	
}

//Horizontal collision
//If there is a place meeting somewhere between the bullet's current horizontal position + their speed...
if (place_meeting(x + hSpd, y, oWall))
{
	//While the bullet's current position is greater than 1 pixel away from the wall, approach it one pixel at a time
	while (!place_meeting(x + sign(hSpd), y, oWall))
	{
		x += sign(hSpd);
	}
	//There would now be a collision one pixel away, so destroy the bullet.
	instance_destroy(self);
}

//Vertical collision
//If there is a place meeting somewhere between the bullet's current vertical position + their speed...
if (place_meeting(x, y + vSpd, oWall))
{
	//While the bullet's current position is greater than 1 pixel away from the wall, approach it one pixel at a time
	while (!place_meeting(x, y + sign(vSpd), oWall))
	{
		y += sign(vSpd);
	}
	//There would now be a collision one pixel away, so destroy the bullet.
	instance_destroy(self);
}

/// @description Core Logic

x += hSpd * dir;

if (activeFrames < 130)
{
	activeFrames++;	
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

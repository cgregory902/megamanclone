/// @description Core logic

//If fireball hits a wall horizontally (the bounds of the room), destroy the fireball
//If there is a place meeting somewhere between the fireball's current horizontal position + their speed...
if (place_meeting(x + hSpd, y, oWall))
{
	//While the fireball's current position is greater than 1 pixel away from the wall, approach it one pixel at a time
	while (!place_meeting(x + sign(hSpd), y, oWall))
	{
		x += sign(hSpd);
	}
	//There would now be a collision one pixel away, so destroy the fireball.
	instance_destroy(self);
}

x += hSpd * -dir;

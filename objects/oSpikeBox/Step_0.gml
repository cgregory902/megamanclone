/// @description Core logic

//If the box is about to hit a wall, change direction...
//If there is place meeting between box's current x position and its speed...
if (place_meeting(x + hSpd, y, oWall))
{
	while (!place_meeting(x + currentDirection, y, oWall))
	{
		x += sign(hSpd);
	}
	currentDirection *= -1;
}
//If the box is about to fall off a wall, change direction...
//If there is not a place meeting between the box's current x position and its speed, and there is no wall beneath the box
if (!place_meeting(x + hSpd, y + 1, oWall))
{
	while (place_meeting(x + currentDirection, y, oWall))
	{
		x += sign(hSpd);
	}
	currentDirection *= -1;
}

//Determines the position the box will end up 
hSpd = movSpd * currentDirection;
x += hSpd;

/// @description Core logic

if ((oPlayer.x - self.x) < 0)
{
	currentDirection = -1;
	image_xscale = currentDirection
}
else
{
	currentDirection = 1
	image_xscale = currentDirection;	
}

if (self.count < 60)
{
	self.count++;
}
else
{
	throwAxe(self.x, self.y);
	count = 0;
}

//Movement code would be placed here
//Maybe object acts like red shell in mario and patrols the platform it's on?
//Otherwise, could move left to right in a set amount of px unless it encounters a wall, etc

//If chuck is about to hit a wall, change direction...
//If there is place meeting between box's current x position and its speed...
if (place_meeting(x + hSpd, y, oWall))
{
	while (!place_meeting(x + directionMoving, y, oWall))
	{
		x += sign(hSpd);
	}
	directionMoving *= -1;
}
//If chuck is about to fall off a wall, change direction...
//If there is not a place meeting between the box's current x position and its speed, and there is no wall beneath the box
if (!place_meeting(x + (sprite_width * directionMoving), y + 1, oWall))
{
	while (place_meeting(x + directionMoving, y, oWall))
	{
		x += sign(hSpd);
	}
	directionMoving *= -1;
}

//If chuck is invulnerable, tick up counter 
if (self.invuln == true && self.iFrames < 60)
{
	self.iFrames++;
}
//When counter reaches 60 frames, make vulnerable and reset iFrames
if (self.iFrames >= 60)
{
	self.invuln = false;
	self.iFrames = 0;
}

x += hSpd * directionMoving;
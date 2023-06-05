/// @description Core logic

//If slim hits either side of the room or a wall, change direction:
if (x >= 1366 || x <= 0 || place_meeting(x + dir, y, oWall))
{
	dir *= -1;
	
}

x += spd * dir;

//If slim is invulnerable and less than 60 frames have passed, increment iFrames
if (self.invuln && iFrames < 60)
{
	self.iFrames++;
}
//If invulnerable and 60 frames have passed, reset boolean and frame count
else
{
	self.invuln = false;
	self.iFrames = 0;
}

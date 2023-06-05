/// @description Core logic

//If slim hits ceiling, floor, or a wall, change direction;
if (y >= 768 || y <= 0 || place_meeting(x, y + dir, oWall))
{
	dir *= -1;
	
}

y += spd * dir;

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

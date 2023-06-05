/// @description Core logic

//Apply force of gravity to vertical speed each frame 
vSpd += grav;

//Operator for the boss state machine
switch (self.currentAction)
{
	case bossActions.jump:
		jump();
		break;
	case bossActions.wait:
		wait();
		break;
	case bossActions.shoot:
		shoot();
		break;
	case bossActions.decideNext:
		decideNext();
		break;
}

//Vertical collision
//If there is a place meeting somewhere between the player's current vertical position + their speed...
if (place_meeting(x, y + self.vSpd, oWall))
{
	//While the player's current position is greater than 1 pixel away from the wall, approach it one pixel at a time.
	while (!place_meeting(x, y + sign(self.vSpd), oWall))
	{
		y += sign(self.vSpd);
	}
	//There would now be a collision one pixel away, so vertical speed should be zero.
	self.vSpd = 0;
}

//If boss is currently invulnerable, increment iFrames
if (self.invuln && self.iFrames < 60)
{
	self.iFrames++;	
}

//When 60 iFrames have passed, boss becomes vulnerable again
if (self.iFrames >= 60)
{
	self.invuln = false;
	iFrames = 0;
}

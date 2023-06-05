/// @description Core Logic

//Make sure sprite faces player
//If the player's x position minus the enemy's is negative, it is on the left of the enemy
if ((oPlayer.x - self.x) < 0)
{
	currentDirection = 1;
	image_xscale = currentDirection
}
else
{
	currentDirection = -1
	image_xscale = currentDirection;	
}

//Shoot logic
//If the enemy isn't in their cooldown phase, shoot a bullet
if (!isShooting && coolDown == 0)
{
	audio_play_sound(auEnemyShoot, 1, false);
	isShooting = true;
	instance_create_layer(self.x, self.y, "Instances", oEnemyBullet);
	
}
//If in cooldown phase, increment cooldown by 1 for the frame
if (isShooting && coolDown < 60)
{
	coolDown++;
}
//If 60 frames have passed, reset cooldown frames and exit cooldown to shoot again 
else
{
	coolDown = 0;
	isShooting = false;
}

//If gunguy is invulnerable, tick up counter 
if (self.invuln == true && self.iFrames < 60)
{
	self.iFrames++;
}
//When counter reaches 60 frames, make vulnerable and reset iFrames
if (iFrames >= 60)
{
	self.invuln = false;
	self.iFrames = 0;
}

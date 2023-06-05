//Boss behaviors

//Randomly decide the boss's next behavior out of 2 options (jump + shoot or punch)
function decideNext()
{
	randomNum = irandom(1);
	//If decideNext rolls a 0, next action is jump
	if (randomNum = 0)
	{
		oBoss.currentAction = bossActions.jump;
	}
	//If it rolls 1, next action is shoot
	else if (randomNum = 1)
	{
		oBoss.currentAction = bossActions.shoot;
	}
}

//The boss should wait 60 frames (1 second) between actions, 45 frames if at 33% health
//When the correct amount of frames has passed, reset waitFrames and set the next action to be decideNext
function wait()
{
	//If the boss has more than a half of its health left, wait 60 frames
	if (global.currentHealthBoss > global.maxHealthBoss / 2)
	{
		if (oBoss.waitFrames < 60)
		{
			oBoss.waitFrames++;	
		} 
		else
		{
			oBoss.waitFrames = 0;
			oBoss.currentAction = bossActions.decideNext;
		}
	}
	//If the boss has less than or equal to half of its health left, wait 45 frames
	else
	{
		if (oBoss.waitFrames < 45)
		{
			oBoss.waitFrames++;	
		} 
		else
		{
			oBoss.waitFrames = 0;
			oBoss.currentAction = bossActions.decideNext;
		}
	}
}

//The boss will jump from one end of the room to the other and change the direction it's facing
function jump()
{
	//If not jumping and touching the floor, jump
	if (!oBoss.jumping && oBoss.place_meeting(oBoss.x, oBoss.y + 1, oWall))
	{
		oBoss.jumping = true;	
		oBoss.vSpd = -oBoss.jumpSpd;
	}
	//When jumping is true, vSpd is set to -jumpSpd and x is moved accordingly
	if (oBoss.jumping)
	{
		oBoss.x += oBoss.dir * oBoss.hSpd;
	}

	//Y coordinate must be calced here to avoid the code below being reached on the first iteration
	oBoss.y += oBoss.vSpd;
	
	//After calculating position, if vSpd is >= 0, boss has reached apex of jump
	//So, shoot spreadshot, then set boolean to false so multiples aren't fired
	if (vSpd >= 0 && shootSpread)
	{
		oBoss.shootSpread = false;
		spreadShot();
	}

	//If the object is jumping but also touching the ground, they have touched down from the jump
	//Switch jumping to false, switch sprite direction, reset spreadshot boolean, and decide next action
	if (oBoss.jumping && oBoss.place_meeting(oBoss.x, oBoss.y + 1, oWall))
	{
		audio_play_sound(auBossTouchdown, 1, false);
		oBoss.jumping = false;
		oBoss.dir *= -1;
		oBoss.image_xscale *= -1;
		oBoss.shootSpread = true;
		oBoss.currentAction = bossActions.wait;
	}
}

//Boss shoots a fireball that travels along the ground, dissipates when it hits a wall horizontally
function shoot()
{
	instance_create_layer(oBoss.x, oBoss.y + 20, "Instances", oFireball);
	audio_play_sound(auFireball, 1, false);
	oBoss.currentAction = bossActions.wait;
}

//Creae 3 bullets each with different spread from center of boss object
function spreadShot()
{
	audio_play_sound(auSpreadShot, 1, false);
	instance_create_layer(oBoss.x, oBoss.y, "Instances", oEnemyBulletStatic);
	instance_create_layer(oBoss.x, oBoss.y, "Instances", oEnemyBulletDiagLeft);
	instance_create_layer(oBoss.x, oBoss.y, "Instances", oEnemyBulletDiagRight);
	//If the boss has 1/2 or less health, fire the extra two shots
	//FIXME: this looks janky, is there another way to do this? 
	//FIXME: potential solution would be to create new objects w/ different speeds or increase boss sprite size
	//FIXME: what about arms outstretched throwing the bullets?
	if (global.currentHealthBoss <= global.maxHealthBoss / 2)
	{
		instance_create_layer(oBoss.x - 250, oBoss.y, "Instances", oEnemyBulletDiagLeft);
		instance_create_layer(oBoss.x + 250, oBoss.y, "Instances", oEnemyBulletDiagRight);
	}
}
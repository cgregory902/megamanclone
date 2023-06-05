/// @description functions that the oPlayer step event will run when in certain states

//The code to run in the player step event when "free"
function free()
{
	//Boolean values are 1 for true and 0 for false so you can add and subtract them. 
	//If right key is pressed, returns 1. If left is pressed, returns -1. If both are pressed, returns 0.
	var _move = key_right - key_left;

	//Sets horizontal speed depending on key pressed.
	oPlayer.hSpd = _move * oPlayer.walkSpd;

	//Sets vertical speed to be current speed plus affect of gravity.
	oPlayer.vSpd += oPlayer.grav;
	
	//jump
	if (place_meeting(oPlayer.x, oPlayer.y + 20, oWall)) && (key_jump)
	{
		//Must be negative jumpSpd because top of room is 0
		audio_play_sound(auPlayerJump, 1, false);
		oPlayer.vSpd = -oPlayer.jumpSpd;	
	}
	
	//jump on one way platform
	if (place_meeting(oPlayer.x, oPlayer.y + 20, oOneWayPlatform)) && (key_jump)
	{
		//Must be negative jumpSpd because top of room is 0
		audio_play_sound(auPlayerJump, 1, false);
		oPlayer.vSpd = -oPlayer.jumpSpd;	
	}
	
	//Variable jump height: short hops, etc.
	//Player object is moving up and the jump button isn't being held down
	if ((oPlayer.vSpd < 0) && (!key_jump_held))
	{
		oPlayer.vSpd = max(oPlayer.vSpd, -oPlayer.jumpSpd / 4);
	}
	
	var _hSpdFinal = oPlayer.hSpd + oPlayer.hSpdCarry;
	var _vSpdFinal = oPlayer.vSpd + oPlayer.vSpdCarry;
	oPlayer.hSpdCarry = 0;
	oPlayer.vSpdCarry = 0;
	
	//Accounting for collision with one way platform
	if (oPlayer.vSpd >= 0 && !place_meeting(x, y, oOneWayPlatform))
	{
		if (place_meeting(oPlayer.x, oPlayer.y + _vSpdFinal, oOneWayPlatform))
		{
			while (!place_meeting(oPlayer.x, oPlayer.y + sign(_vSpdFinal), oOneWayPlatform))
			{
				oPlayer.y += sign(_vSpdFinal);
			}
			_vSpdFinal = 0;
			oPlayer.vSpd = 0;
		}
	}
	
	//Horizontal collision
	//If there is a place meeting somewhere between the player's current horizontal position + their speed...
	if (place_meeting(oPlayer.x + _hSpdFinal, oPlayer.y, oWall))
	{
		//While the player's current position is greater than 1 pixel away from the wall, approach it one pixel at a time
		while (!place_meeting(oPlayer.x + sign(_hSpdFinal), oPlayer.y, oWall))
		{
			oPlayer.x += sign(_hSpdFinal);
		}
		//There would now be a collision one pixel away, so horizontal speed should be zero
		_hSpdFinal = 0;
		oPlayer.hSpd = 0;
	}

	//Vertical collision
	//If there is a place meeting somewhere between the player's current vertical position + their speed...
	if (place_meeting(oPlayer.x, oPlayer.y + _vSpdFinal, oWall))
	{
		//While the player's current position is greater than 1 pixel away from the wall, approach it one pixel at a time.
		while (!place_meeting(oPlayer.x, oPlayer.y + sign(_vSpdFinal), oWall))
		{
			oPlayer.y += sign(_vSpdFinal);
		}
		//There would now be a collision one pixel away, so vertical speed should be zero.
		_vSpdFinal = 0;
		oPlayer.vSpd = 0;
	}
	
	//Shoot
	if ((key_shoot) && (oPlayer.numBullets < 3))
	{
		playerShoot();
	}
	
	//Slash
	if ((key_slash) && (!oPlayer.isSlashing) && (oPlayer.slashCooldown = 0))
	{
		playerSlash();
	}
	
	//If there are no collisions with walls detected, speed should affect movement as normal.
	oPlayer.x += _hSpdFinal;
	oPlayer.y += _vSpdFinal;
	
	//update slash cooldown
	slashCooldownCheck();

	
	//update free invuln
	if (oPlayer.invulnFree && oPlayer.iFramesFree < 15)
	{
		oPlayer.iFramesFree++;
		object_set_sprite(oPlayer, sInvulnFree);
	}
	else
	{
		object_set_sprite(oPlayer, sPlayer);
		oPlayer.invulnFree = false;
		oPlayer.iFramesFree = 0;
	}
	
	//If pressing up and on a ladder, freeze player and switch to ladder state
	if (key_up && place_meeting(oPlayer.x, oPlayer.y, oLadder))
	{
		oPlayer.hSpd = 0;
		oPlayer.vSpd = 0;
		oPlayer.x = instance_place(oPlayer.x, oPlayer.y, oLadder).x;
		oPlayer.currentState = playerStates.onLadder;
	}
}

//The code to run in the player step event when knocked back
function knockedBack()
{
	//Set the player sprite to be the knocked back animation
	//Be sure to switch to the original sprite when switching back to the free state
	object_set_sprite(oPlayer, sKnockedBack);
	//Sets vertical speed to be current speed plus affect of gravity.
	oPlayer.vSpd += oPlayer.grav;
	oPlayer.hSpd = oPlayer.directionHit * 3;
	
	var _hSpdFinal = oPlayer.hSpd + oPlayer.hSpdCarry;
	var _vSpdFinal = oPlayer.vSpd + oPlayer.vSpdCarry;
	oPlayer.hSpdCarry = 0;
	oPlayer.vSpdCarry = 0;
	
	//Horizontal collision
	//If there is a place meeting somewhere between the player's current horizontal position + their speed...
	if (place_meeting(oPlayer.x + _hSpdFinal, oPlayer.y, oWall))
	{
		//While the player's current position is greater than 1 pixel away from the wall, approach it one pixel at a time
		while (!place_meeting(oPlayer.x + sign(_hSpdFinal), oPlayer.y, oWall))
		{
			oPlayer.x += sign(_hSpdFinal);
		}
		//There would now be a collision one pixel away, so horizontal speed should be zero
		_hSpdFinal = 0;
		oPlayer.hSpd = 0;
	}

	//Vertical collision
	//If there is a place meeting somewhere between the player's current vertical position + their speed...
	if (place_meeting(oPlayer.x, oPlayer.y + _vSpdFinal, oWall))
	{
		//While the player's current position is greater than 1 pixel away from the wall, approach it one pixel at a time.
		while (!place_meeting(oPlayer.x, oPlayer.y + sign(_vSpdFinal), oWall))
		{
			oPlayer.y += sign(_vSpdFinal);
		}
		//There would now be a collision one pixel away, so vertical speed should be zero.
		_vSpdFinal = 0;
		oPlayer.vSpd = 0;
	}
	
	//Once wall collisions have been accounted for, move player coordinates as normal
	//Player object moved horizontally by 5 frames in the direction they're moving after being hit
	oPlayer.x += _hSpdFinal;
	
	//Gravity should still affect the player while knocked back
	oPlayer.y += _vSpdFinal;
	
	//update slash cooldown
	slashCooldownCheck();
	
	//The following code replaces old iFrame calculation on collisions from being hit
	if (oPlayer.iFrames < 60)
	{
		oPlayer.iFrames++;
	}
	else
	{
		oPlayer.currentState = playerStates.free();
		oPlayer.invulnFree = true;
		oPlayer.iFrames = 0;
	}
}

//The code to run in the player step event when climbing a ladder
//FIXME: UNFINISHED AS FUCK
function onLadder()
{
	var _climb = key_down - key_up;
	oPlayer.vSpd = _climb * oPlayer.walkSpd;
	
	//Jumping sets vSpd to -jumpSpd and state to free
	if (key_jump)
	{
		oPlayer.currentState = playerStates.free;
		oPlayer.vSpd = max(oPlayer.vSpd, -oPlayer.jumpSpd / 2);
		audio_play_sound(auPlayerJump, 1, false);
	}
	
	//Vertical collision
	//If there is a place meeting somewhere between the player's current vertical position + their speed...
	if (place_meeting(oPlayer.x, oPlayer.y + oPlayer.vSpd, oWall))
	{
		//While the player's current position is greater than 1 pixel away from the wall, approach it one pixel at a time.
		while (!place_meeting(oPlayer.x, oPlayer.y + sign(oPlayer.vSpd), oWall))
		{
			oPlayer.y += sign(oPlayer.vSpd);
		}
		//There would now be a collision one pixel away, so vertical speed should be zero.
		oPlayer.vSpd = 0;
	}
	
	//Shoot
	if ((key_shoot) && (oPlayer.numBullets < 3))
	{
		playerShoot();
	}
	
	//Slash
	if ((key_slash) && (!oPlayer.isSlashing) && (oPlayer.slashCooldown = 0))
	{
		playerSlash();
	}
	
	//update slash cooldown
	slashCooldownCheck();
	
	//update free invuln
	if (oPlayer.invulnFree && oPlayer.iFramesFree < 15)
	{
		oPlayer.iFramesFree++;
		object_set_sprite(oPlayer, sInvulnFree);
	}
	else
	{
		object_set_sprite(oPlayer, sPlayer);
		oPlayer.invulnFree = false;
		oPlayer.iFramesFree = 0;
	}
	
	//Once collisions have been calced, apply vertical position
	oPlayer.y += oPlayer.vSpd;
	
	//If player isn't touching a ladder, set state to free
	if (!place_meeting(oPlayer.x, oPlayer.y, oLadder))
	{
		oPlayer.currentState = playerStates.free;
	}
	
	//If player is holding down and they are touching a wall, set state to free (exit ladder)
	if (key_down && place_meeting(oPlayer.x, oPlayer.y + 1, oWall))
	{
		oPlayer.currentState = playerStates.free;
	}
}

//Code to run in player step event when dead
function dead()
{
	oPlayer.hSpd = 0;
	oPlayer.vSpd = 0;
	
	//If player is in death screen cooldown, increment counter and play sound if you haven't yet
	if (oPlayer.deathFrames < 150)
	{
		//Play death sound if boolean hasn't been flipped
		oPlayer.deathFrames++;
		if (oPlayer.playDeathSound)
		{
			audio_play_sound(auPlayerDeath, 100, false);
			oPlayer.playDeathSound = false;
		}
	}
	else
	//FIXME: need branching code here for checkpoints. Not sure how to implement in the grand scheme of things
	//Will likely need to be reworked later 
	{
		game_restart();
	}
}

//A script which outlines certain player actions, such as shoot, slash, etc

//Code to be executed when the player shoots
function playerShoot()
{
	audio_play_sound(auPlayerShoot, 1, false);
	instance_create_layer(oPlayer.x, oPlayer.y, "Instances", oBullet);
	oPlayer.numBullets++;
}

//Code to be executed when the player slashes
function playerSlash()
{
	audio_play_sound(auPlayerSlash, 1, false);
	oPlayer.isSlashing = true;
	instance_create_layer((oPlayer.x + (64 * currentDirection)), oPlayer.y - 64, "Instances", oSlash);
	//Fixes bug where on first frame of slash, slash would be facing wrong direction
	oSlash.image_xscale = oPlayer.currentDirection;
}

//Code run at the end of each of oPlayer's step events
//Ensures that the player only slashes when the cooldown has been reset
function slashCooldownCheck()
{
	//If the amount of frames hasn't been passed after the slash, the number of cooldown frames is incremented
	if (global.slashFrames > global.slashFramesMin && oPlayer.isSlashing)
	{
		global.slashFrames--;	
	}
	//If the threshold for amount of frames has been reached, reset the number of cooldown frames as well as the slash boolean
	else
	{
		global.slashFrames = 120;
		oPlayer.isSlashing = false;
	}
}

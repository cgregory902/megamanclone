/// @description Enemy bullet hitting player

instance_destroy(self);
if (oPlayer.currentState != playerStates.knockedBack && !oPlayer.invulnFree)
{
	audio_play_sound(auPlayerHit, 1, false);
	oPlayer.currentState = playerStates.knockedBack;
	global.currentHealth -= 3;
	oPlayer.directionHit = sign(oPlayer.x - self.x);
}


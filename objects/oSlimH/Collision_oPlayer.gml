/// @description Hit by SlimH

if (oPlayer.currentState != playerStates.knockedBack && oPlayer.currentState != playerStates.dead && !oPlayer.invulnFree)
{
	audio_play_sound(auPlayerHit, 1, false);
	global.currentHealth -= 3;
	oPlayer.currentState = playerStates.knockedBack;
	oPlayer.directionHit = sign(oPlayer.x - self.x);
}

/// @description When box hits the player

if (oPlayer.currentState != playerStates.knockedBack && oPlayer.currentState != playerStates.dead && !oPlayer.invulnFree)
{
	oPlayer.directionHit = sign(oPlayer.x - self.x);
	audio_play_sound(auPlayerHit, 1, false);
	oPlayer.currentState = playerStates.knockedBack;
	global.currentHealth -= 5;
}

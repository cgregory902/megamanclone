/// @description Player hit by fireball

if (oPlayer.currentState != playerStates.knockedBack && oPlayer.currentState != playerStates.dead && !oPlayer.invulnFree)
{
	audio_play_sound(auPlayerHit, 1, false);
	oPlayer.currentState = playerStates.knockedBack;
	global.currentHealth -= 5;
	oPlayer.directionHit = sign(oPlayer.x - self.x);
}

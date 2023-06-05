/// @description GunGuy touches player

if (oPlayer.currentState != playerStates.knockedBack && oPlayer.currentState != playerStates.dead && !oPlayer.invulnFree)
{
	oPlayer.currentState = playerStates.knockedBack;
	global.currentHealth -= 5;
	audio_play_sound(auPlayerHit, 1, false);
	oPlayer.directionHit = sign(oPlayer.x - self.x);
}

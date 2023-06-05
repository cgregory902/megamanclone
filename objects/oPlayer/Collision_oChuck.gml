/// @description oChuck touches player

if (oPlayer.currentState != playerStates.knockedBack && oPlayer.currentState != playerStates.dead && !oPlayer.invulnFree)
{
	audio_play_sound(auPlayerHit, 1, false);
	oPlayer.currentState = playerStates.knockedBack;
	global.currentHealth -= 3;
	oPlayer.directionHit = sign(oPlayer.x - oBoss.x);
}
/// @description Health box collides with player

//If the player collides with the health box, destroy the box and increase player health by 10
audio_play_sound(auHealthPickup, 1, false);
instance_destroy(self);
if (global.currentHealth + 6 > global.maxHealth)
{
	global.currentHealth = global.maxHealth;	
}
else
{
	global.currentHealth += 6;
}

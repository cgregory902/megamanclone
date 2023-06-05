/// @description Creating health bar, image when dead

if (instance_exists(oPlayer))
{
	//Draw player health bar
	draw_sprite(sHealthBack, 1, 8, 9);
	draw_sprite_ext(sHealthFront, 1, 8, 9, max(0, global.currentHealth/global.maxHealth), 1, 0, c_white, 1);
	
	//Draw player stamina bar
	//FIXME: this is super jank
	draw_sprite(sStaminaBack, 1, 32, 189);
	draw_sprite_ext(sStaminaFront, 1, 32, 189, 1, max(0, global.slashFrames/global.slashFramesMax), 180, c_white, 1);
}

//Draw boss health bar
if (instance_exists(oBoss))
{
	draw_sprite(sHealthBack, 1, 1000, 9);
	draw_sprite_ext(sHealthFrontBoss, 1, 1000, 9, max(0, global.currentHealthBoss/global.maxHealthBoss), 1, 0, c_white, 1);
}

//Draw death screen if dead
if (global.currentHealth <= 0)
{
	draw_sprite(sYouDied, 1, 0, 0);
}

/// @description Core logic

if (count < 120)
{
	count++;
}
else
{
	count = 0;
	hSpd *= -1;
}

x += hSpd;

//If player is standing on moving platform, transfer its movement speed to player
if (place_meeting(x, y - 1, oPlayer))
{
	oPlayer.hSpdCarry = self.hSpd;
}

/*
//If player is touching the side of a platform, if player is on the side it's moving towards, move player
if (place_meeting(x + (sprite_width / 2), y, oPlayer) && !(place_meeting(x, y - 1, oPlayer)))
{
	oPlayer.hSpd = 0;
	oPlayer.hSpd += self.hSpd;
}
*/
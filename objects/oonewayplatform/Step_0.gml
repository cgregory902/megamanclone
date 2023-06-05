/// @description Core Logic

//Every 2 seconds (or whenever I want to change it to), the platform switches direction
if (count < 120)
{
	count++;
}
else
{
	vSpd *= -1;
	count = 0;
}

x += hSpd;
y += vSpd;

//If player is standing on moving platform, transfer its movement speed to player
//The first place meeting checks if player is on top
//The bottom two check if the player is not touching the middle or bottom of the sprite

//FIXME: this does not account for every way the player can be touching the platform
//Eg look at how the carry value is given to the player when they jump all the way through the platform
if (place_meeting(x, y - (sprite_height / 2), oPlayer) &&
	!place_meeting(x, y, oPlayer) &&
	!place_meeting(x, y + (sprite_height / 2), oPlayer))
{
	oPlayer.hSpdCarry = self.hSpd;
	oPlayer.vSpdCarry = self.vSpd;
}
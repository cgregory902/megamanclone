/// @description Core logic

//If the fly's coordinates aren't equal to the player's, approach the player 
if (self.x != oPlayer.x && self.y != oPlayer.y)
{
	//Moves the fly towards the direction of the player by determining the correct direction and multiplying that by speed
	self.x += sign(oPlayer.x - self.x) * spd;
	self.y += sign(oPlayer.y - self.y) * spd;
}


/// @description Core logic

//Set sprite to face proper direction
image_xscale = oPlayer.currentDirection;

//The slash window is active for 10 frames
if (oSlash.activeFrames < 10)
{
	oSlash.activeFrames++;
}
else
{
	instance_destroy(self);
}

//The slash should move with the player based on their current position and direction
x = oPlayer.x + (64 * oPlayer.currentDirection);
y = oPlayer.y - 64;



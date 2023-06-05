/// @description Core logic

//Distance logic
x += dir * hSpd;

//This bullet will stay active for 60 frames, then destroy itself and give the player an extra bullet.
if (activeFrames < 60)
{
	activeFrames++;
}
else
{
	instance_destroy(self);
}

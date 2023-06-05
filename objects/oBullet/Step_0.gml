/// @description Core logic

//Distance logic
x += self.dir * self.hSpd;

//This bullet will stay active for 60 frames, then destroy itself and give the player an extra bullet.
if (self.activeFrames < 60)
{
	self.activeFrames++;
}
else
{
	instance_destroy(self);
	oPlayer.numBullets--;
}

/// @description Boss hit by slash

if (!self.invuln)
{
	global.currentHealthBoss -= 3;
	self.invuln = true;
}
if (global.currentHealthBoss <= 0)
{
	instance_destroy(self);
}

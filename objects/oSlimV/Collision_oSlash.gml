/// @description Hit by slash

if (!self.invuln)
{
	self.hp -= 3;
	invuln = true;
	
}
if (self.hp <= 0)
{
	dropHealth(self.x, self.y);
	instance_destroy(self);
}

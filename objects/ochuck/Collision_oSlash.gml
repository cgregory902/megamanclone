/// @description chuck hit by slash

//If chuck isn't invulnerable, deal 3 damage and make invulnerable
if (!self.invuln)
{
	self.hp -= 3;
	self.invuln = true;
}
if (self.hp <= 0)
{
	dropHealth(self.x, self.y);
	instance_destroy(self);	
}
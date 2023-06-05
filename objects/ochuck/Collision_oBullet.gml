/// @description chuck hit by bullet

self.hp--;
if (self.hp <= 0)
{
	instance_destroy(self);
	dropHealth(self.x, self.y);
}
/// @description Hit by bullet

self.hp--;
if (self.hp <= 0)
{
	instance_destroy(self);	
}

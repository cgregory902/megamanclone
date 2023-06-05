/// @description Hit by slash

self.hp -= 3;
if (self.hp <= 0)
{
	instance_destroy(self);	
}

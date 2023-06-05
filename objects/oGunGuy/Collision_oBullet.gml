/// @description GunGuy -> oBullet collision

self.hp--;

if (self.hp <= 0)
{
	dropHealth(self.x, self.y);
	instance_destroy(self);	
}
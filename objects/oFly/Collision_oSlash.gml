/// @description oFly -> oBullet collision

self.hp -=3;
if (self.hp <= 0)
{
	dropHealth(self.x, self.y);
	instance_destroy(self);	
}

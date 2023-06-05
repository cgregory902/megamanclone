/// @description oFly -> oBullet collision

self.hp--;
if (hp <= 0)
{
	dropHealth(self.x, self.y);
	instance_destroy(self);	
}

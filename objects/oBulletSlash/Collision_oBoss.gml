/// @description oBullet -> oBoss collision

global.currentHealthBoss--;
instance_destroy(self);
if (global.currentHealthBoss <= 0)
{
	instance_destroy(oBoss);	
}

/// @description Core Logic

self.x += self.hSpd * self.currentDirection;
self.y += self.vSpd;
self.vSpd += self.grav;

//When axe falls offscreen, destroy it
if (self.y > room_height + 150)
{
	instance_destroy(self);	
}
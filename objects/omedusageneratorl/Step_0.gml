if (self.count < 180)
{
	self.count++;	
}
else
{
	self.count = 0;
	self.randomNum = irandom(2);
	
	switch (randomNum)
	{
	
		case 0:
			instance_create_layer(self.x, self.y, "Instances", oMedusaL);
			break;
		case 1:
			instance_create_layer(self.x, self.y + (sprite_height / 2), "Instances", oMedusaL);
			break;
		case 2:
			instance_create_layer(self.x, self.y - (sprite_height) / 2, "Instances", oMedusaL);
			break;
	}
}
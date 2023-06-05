/// @function dropHealth(xCoord, yCoord)
/// @description Has 15% chance of dropping a health box at the x and y coordinate where an enemy dies
function dropHealth(xCoord, yCoord)
{
	if (irandom(99) <= 14)
	{
		instance_create_layer(xCoord, yCoord, "Instances", oHealth);
	}
}

//Throws an axe in one of three arcs randomly
function throwAxe(xCoord, yCoord)
{
	num = irandom(2);
	switch (num)
	{
		//Default case
		case 0:
			axe = instance_create_layer(xCoord, yCoord, "Instances", oAxe);
			//oAxe's default direction is left. If the player is on the right of chuck, should switch the axe's direction
			if ((oPlayer.x - self.x) >= 0)
			{
				axe.currentDirection = 1;
			}
			break;
			
		case 1:
			axe = instance_create_layer(xCoord, yCoord, "Instances", oAxe);
			//oAxe's default direction is left. If the player is on the right of chuck, should switch the axe's direction
			if ((oPlayer.x - self.x) >= 0)
			{
				axe.currentDirection = 1;
			}
			//change to a non-default arc using axe's instance variables
			axe.hSpd = 5;
			axe.vSpd = -18;
			break;
			
		case 2:
			axe = instance_create_layer(xCoord, yCoord, "Instances", oAxe);
			//oAxe's default direction is left. If the player is on the right of chuck, should switch the axe's direction
			if ((oPlayer.x - self.x) >= 0)
			{
				axe.currentDirection = 1;
			}
			//change to a non-default arc using axe's instance variables
			axe.hSpd = 3;
			axe.vSpd = -30;
			break;
	}
}
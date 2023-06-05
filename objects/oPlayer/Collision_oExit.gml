/// @description Player touches exit object

//When player touches the object, if there is a next room, go to next room
if (room_next(room) != -1)
{
	room_goto_next();	
}


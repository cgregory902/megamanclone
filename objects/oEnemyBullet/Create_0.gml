/// @description Initialize variables

//The direction the bullet should fly
dir = sign(oPlayer.x - self.x);
//Horizontal speed
hSpd = 8;
//Tracker for active frames. At 100, it destroys itself
activeFrames = 0;

/// @description Initializing core variables

//Vertical speed before applying jump speed
vSpd = 0;
//Horizontal speed
hSpd = 7.5;
//The effect of gravity 
grav = 0.15
//Jump speed
jumpSpd = 11;
//The direction the sprite is facing: -1 is left, 1 is right
dir = -1;
//Boolean which checks if object is jumping in jump state
jumping = false;
//Counter for frames in which the boss has been waiting between actions
waitFrames = 0;
//The enum which represents the state machine for the boss
enum bossActions
{
	jump,
	shoot,
	wait,
	decideNext
}
//The first thing the boss does is jump, then decides randomly from there
currentAction = bossActions.jump;
//Boolean which states if it's okay to shoot spreadshot while jumping
shootSpread = true;
//Boolean which states if boss is invulnerable to slash
invuln = false;
//Counter for slash iFrames
iFrames = 0;

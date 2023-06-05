/// @description Initialize key variables

//The states that the player object can be in
enum playerStates
{
	free,
	onLadder,
	knockedBack,
	dead
}
//The player object's current state, initialized to free
currentState = playerStates.free;
//Horizontal movement speed
hSpd = 0;
//Horizontal movement speed mod when on a moving platform
hSpdCarry = 0;
//Vertical movement speed
vSpd = 0;
//Vertical movement speed mod when on a moving platform
vSpdCarry = 0;
//The force of gravity
grav = 0.8;
//Player's walk speed
walkSpd = 4;
//Player's jump speed
jumpSpd = 15.5;
//The number of bullets a player can shoot, 3 max
numBullets = 0;
//Boolean showing if a slash is active
isSlashing = false;
//Amount of cooldown frames that have passed
slashCooldown = 0;
//Used in later calculations in player step event
previousPosition = x;
//if x is higher than it was previously or equal, player is facing right. Otherwise, player is facing left.
//left is denoted by -1, right by 1.
currentDirection = 1;
//Boolean which is set to indicate the direction the player should move after being hit and in the knockedBack state
directionHit = -1
//Count of i frames when player is invulnerable in knockedBack state
iFrames = 0;
//Count of i frames when player is invulnerable in free state
iFramesFree = 0;
//Boolean which shows if player should be invulnerable in the free state
invulnFree = false;
//Count of frames to display death image
deathFrames = 0;
//Boolean used to track if death sound should be played
playDeathSound = true;
//Randomizes the seed for health drops whenever the oPlayer object is created
randomise();
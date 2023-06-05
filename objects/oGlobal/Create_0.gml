/// @description Initialize global variables

//Global variable for max health
global.maxHealth = 24;
//Create an object that holds persistent variables to keep the same value through rooms
global.currentHealth = global.maxHealth;
//Max health value for boss 
global.maxHealthBoss = 24;
//CurrentHealth for boss, initialized to 24 (max)
global.currentHealthBoss = global.maxHealthBoss;
//Min slash frames
global.slashFramesMin = 0;
//Max slash frames 
global.slashFramesMax = 120;
//Slash cooldown frames, starts at 60 and decrements to 0
global.slashFrames = global.slashFramesMax;

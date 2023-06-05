/// @description Core Player Logic

// Get player inputs
key_up = gamepad_button_check(4, gp_padu);
key_down = gamepad_button_check(4, gp_padd);
key_left = gamepad_button_check(4, gp_padl);
key_right = gamepad_button_check(4, gp_padr);
key_jump = gamepad_button_check_pressed(4, gp_face1);
key_jump_held = gamepad_button_check(4, gp_face1);
key_shoot = gamepad_button_check_pressed(4, gp_face3);
key_slash = gamepad_button_check_pressed(4, gp_face2);

//Must check their life total each frame. If <= 0, run death script
if (global.currentHealth <= 0)
{
	currentState = playerStates.dead;	
}

//Operator for the player state machine
switch (currentState)
{
	case playerStates.free:
		sprite_index = sPlayer;
		free();
		break;
		
	case playerStates.onLadder:
		onLadder();
		break;
		
	case playerStates.knockedBack:
		sprite_index = sKnockedBack;
		knockedBack();
		break;
		
	case playerStates.dead:
		dead();
		break;	
}

//FIXME: Has this been phased out? I'm not getting the only used once warning.
previousPosition = x;

//Find direction player is facing to decide which direction bullets fly, etc.
//Used in other calculations. 1 = right, -1 = left
if (key_left)
{
	currentDirection = -1;

}
else if (key_right)
{
	currentDirection = 1;
}

//Set sprite to face proper direction
image_xscale = currentDirection;
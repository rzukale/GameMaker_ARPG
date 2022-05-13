if (room == rTitle)
{
	visible = false;
}
else
{
	visible = true;
}

if (global.gamePaused)
{
	keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption))
	{
		pauseOptionSelected = 0;
	}
	if (pauseOptionSelected < 0)
	{
		pauseOptionSelected = array_length(pauseOption) -1;
	}
	keyActivate = keyboard_check_pressed(vk_space);
	if (keyActivate)
	{
		switch (pauseOptionSelected)
		{
			case 0: //Continue
			{
				global.gamePaused = false;
				with (all)
				{
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
					//image_speed = gamePausedImageSpeed;
				}
			} break;
			case 1: //Save and return to main menu
			{
				with (oGame) instance_destroy();
				SaveGame();
				game_restart();				
			} break;
			case 2: // save and quit to desktop
			{
				SaveGame();
				game_end();
			} break;
		}
	}
}

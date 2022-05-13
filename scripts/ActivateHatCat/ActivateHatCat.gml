// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ActivateHatCat()
{
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: // not started
		{
			if (_hasHat)
			{
				// complete quest
				NewTextBox("Hey, That's my hat!\nThank you for finding it!", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC)
				{
					sprite_index = sQuestieHat;
				}
				with (oHat)
				{
					instance_destroy();
				}
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				// offer quest
				NewTextBox("Hello there!\nThat is fine looking cape you have there\n", 2);
				NewTextBox("Could you help me find my missing hat?", 2, ["4:Of course!", "5:This task is beneath me!"]);
			}
		} break;
		case 1: // quest in progress
		{
			if (_hasHat)
			{
				NewTextBox("Wow, you found my hat! Thank you!", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oQuestNPC)
				{
					sprite_index = sQuestieHat;
				}
				with (oHat)
				{
					instance_destroy();
				}
				global.iLifted = noone;
				with (oPlayer)
				{
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			}
			else
			{
				NewTextBox("I think I left it in that\nscary cave to the north east!", 2);
				NewTextBox("You might need some items to get there!", 2);
				// give clue
			}
		} break;
		case 2: // quest completed
		{
			NewTextBox("Thanks again!", 2);
		}
		default:
			break;
	}
}
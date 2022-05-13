// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateHook()
{
	horizontalSpeed = 0;
	verticalSpeed = 0;

	if (sprite_index != sPlayerHook)
	{
		hook = 0;
		hookX = 0;
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING;
		hookedEntity = noone;
		
		sprite_index = sPlayerHook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	// Extend/Retract hook
	var _speedHookTemp = speedHook;
	if (hookStatus != HOOKSTATUS.EXTENDING)
	{
		_speedHookTemp *= -1;
	}
	hook += _speedHookTemp;
	switch (image_index)
	{
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
	}
	
	switch (hookStatus)
	{
		case HOOKSTATUS.EXTENDING:
		{
			if (hook >= distanceHook)
			{
				hookStatus = HOOKSTATUS.MISSED;
			}
			var _hookHit = collision_circle(x + hookX, y + hookY, 4, pEntity, false, true);
			if (_hookHit != noone && global.iLifted != _hookHit)
			{
				switch (_hookHit.entityHookable)
				{
					default:
					{
						if (object_is_ancestor(_hookHit.object_index, pEnemy))
						{
							HurtEnemy(_hookHit, 1, id, 5);
							hookStatus = HOOKSTATUS.MISSED;
						}
						else
						{
							if (_hookHit.entityHitScript != -1)
							{
								with (_hookHit)
								{
									script_execute(entityHitScript);
								}
								hookStatus = HOOKSTATUS.MISSED;
							}
						}
					} break;
					case 1:
					{
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;
					} break;
					case 2:
					{
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
					} break;
				}
			}
		} break;
		case HOOKSTATUS.PULLTOPLAYER:
		{
			with (hookedEntity)
			{
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}
		} break;
		case HOOKSTATUS.PULLTOENTITY:
		{
			switch (image_index)
			{
				case 0: x += speedHook; break;
				case 1: y -= speedHook; break;
				case 2: x -= speedHook; break;
				case 3: y += speedHook; break;
			}
		} break;
	}
	
	if (hook <= 0)
	{
		hookedEntity = noone;
		state = PlayerStateFree;
	}
}
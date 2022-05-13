// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree()
{
	
	// Movement
	horizontalSpeed = lengthdir_x(inputMagnitude * walkSpeed, inputDirection);
	verticalSpeed = lengthdir_y(inputMagnitude * walkSpeed, inputDirection);

	PlayerCollision();

	// update sprite index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else
	{
		sprite_index = spriteIdle;
	}

	if (_oldSprite != sprite_index)
	{
		localFrame = 0;
	}

	// update image index
	PlayerAnimateSprite();
	
	// attack key logic
	if (keyAttack)
	{
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	
	// activate key logic
	if (keyActivate)
	{
		// 1. check for an entity to activate
		// 2. if there is nothing, or there is something but it has no script = roll!
		// 3. otherwise there is something and it has a script = activate
		// 4. if the thing we activate is an NPC, make it face us
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true);
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted && _check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
		}
		ds_list_destroy(_activateList);
		
		if (activate == noone)
		{
			if (global.iLifted != noone)
			{
				PlayerThrow();
			}
			else
			{
				state = PlayerStateRoll;
				moveDistanceRemaining = rollDistance;
			}
		}
		else
		{
			// activate entity 
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			if (activate.entityNPC)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
	if (keyItem && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE))
	{
		switch (global.playerEquipped)
		{
			case ITEM.BOMB: UseItemBomb(); break;
			case ITEM.BOW: UseItemBow(); break;
			case ITEM.HOOK: UseItemHook(); break;
			default: break;
		}
	}
	// cycle items
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
		if (_cycleDirection != 0)
		{
			do
			{
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped < 1)
				{
					global.playerEquipped = ITEM.TYPE_COUNT -1;
				}
				if (global.playerEquipped >= ITEM.TYPE_COUNT)
				{
					global.playerEquipped = 1;
				}
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
		}
	}
}
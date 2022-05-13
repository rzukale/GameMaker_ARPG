// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll()
{
	// movement
	horizontalSpeed = lengthdir_x(rollSpeed, direction);
	verticalSpeed = lengthdir_y(rollSpeed, direction);

	moveDistanceRemaining = max(0, moveDistanceRemaining - rollSpeed);
	var _collided = PlayerCollision();

	// update sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / rollDistance)) * _totalFrames), _totalFrames - 1);

	// change state
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;	
	}
	if (_collided)
	{
		state = PlayerStateBonk;
		moveDistanceRemaining = bonkDistance;
		ScreenShake(4, 20);
	}
}

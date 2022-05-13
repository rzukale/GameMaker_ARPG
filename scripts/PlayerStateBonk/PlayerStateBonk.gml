// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateBonk(){
		// movement
	horizontalSpeed = lengthdir_x(bonkSpeed, direction - 180);
	verticalSpeed = lengthdir_y(bonkSpeed, direction - 180);

	moveDistanceRemaining = max(0, moveDistanceRemaining - bonkSpeed);
	var _collided = PlayerCollision();

	// update sprite
	sprite_index = sPlayerHurt;
	image_index = CARDINAL_DIR + 2;
	
	// change height
	z = sin(((moveDistanceRemaining / bonkDistance) * pi)) * bonkDistanceHeight;

	// change state
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree;	
	}
}
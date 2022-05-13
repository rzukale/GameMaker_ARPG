/// @desc PlayerActOutAnimation(Sprite, EndScript)
/// @arg Sprite
/// @arg EndScript
function PlayerActOutAnimation(Sprite, EndScript){

	state = PlayerStateAct;
	sprite_index = Sprite;
	if (argument_count > 1)
	{
		animationEndScript = EndScript;
	}
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}
state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
horizontalSpeed = 0;
verticalSpeed = 0;
walkSpeed = 2.0;
rollSpeed = 3.0;
rollDistance = 52;
bonkDistance = 40;
bonkDistanceHeight = 12;
bonkSpeed = 1.5;

speedHook = 3.0;
distanceHook = 88;
hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(sHookChain);

z = 0;
invulnerable = 0;
flash = 0;
flashShader = shWhiteFlash;

animationEndScript = -1;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

if (global.iLifted != noone)
{
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerRunCarrying;
	sprite_index = spriteIdle;
}

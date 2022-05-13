/// @description Progress transition
// You can write your code in this editor

with (oPlayer)
{
	if (state != PlayerStateDead)
	{
		state = PlayerStateTransition;
	}
}

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1)
	{
		room_goto(target);
		leading = IN;
	}
}
else
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0)
	{
		with (oPlayer)
		{
			state = PlayerStateFree;
		}
		instance_destroy();
	}
}

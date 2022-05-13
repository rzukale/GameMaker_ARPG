// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ActivateLiftable(_id){

	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(sPlayerLift, -1);
	
		spriteIdle = sPlayerCarrying;
		spriteRun = sPlayerRunCarrying;
		
		global.iLifted = _id;
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}
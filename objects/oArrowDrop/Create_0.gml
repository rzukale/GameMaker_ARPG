/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!global.playerItemUnlocked[collectScriptArg[0]])
{
	instance_change(oCoin, true);
}


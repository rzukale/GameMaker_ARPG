/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove = sSlime;
sprAttack = sSlimeAttack;
sprHurt = sSlimeHurt;
sprDie = sSlimeDie;


enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

entityDropList = choose
(
	[oCoin],
	[oCoin, oCoin],
	[oBombDrop],
	[oArrowDrop]
);

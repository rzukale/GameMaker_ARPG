// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollectCoins(_amount)
{
	global.playerMoney += _amount;
}

function CollectAmmo(_array)
{
	// array == [type, amount]
	global.playerAmmo[_array[0]] += _array[1];
}

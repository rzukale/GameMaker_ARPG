// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoomToAreaName(_room)
{
	switch (_room)
	{
		case rVillage: return "The Village"; break;
		case rRiver: return "The River"; break;
		case rCave: return "The Cave"; break;
		case rShop: return "The Shop"; break;
		default: return "Unknown Area"; break;
	}
}
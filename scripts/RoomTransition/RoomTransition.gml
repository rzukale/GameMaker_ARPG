/// @desc RoomTransition(type, targetRoom)
/// @arg Type
/// @arg targetRoom
function RoomTransition(_type, targetRoom){
	
	if (!instance_exists(oTransition))
	{
		with (instance_create_depth(0, 0, -9999, oTransition))
		{
			type = _type;
			target = targetRoom;
		}
	}
	else
	{
		show_debug_message("Trying to transition while transition is happening!");
	}
	
}
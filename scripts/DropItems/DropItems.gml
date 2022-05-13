/// @desc DropItems(_x, _y, _items)
/// @arg {real} _x
/// @arg {real} _y
/// @arg _items
function DropItems(_x, _y, items)
{
	var _items = array_length(items);
	if (_items > 1)
	{
		var _anglePerItem = 360 / _items;
		var _angle = random(360);
		for (var i = 0; i < _items; i++)
		{
			with (instance_create_layer(argument0, argument1, "Instances", argument2[i]))
			{
				direction = _angle;
				spd = 0.75 + (_items * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
	}
	else
	{
		instance_create_layer(argument0, argument1, "Instances", argument2[0]);
	}
}
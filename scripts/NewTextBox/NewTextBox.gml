// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(){
	var _obj;
	if (instance_exists(oText))
	{
		_obj = oTextQueued
	}
	else
	{
		_obj = oText;
	}
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		message = argument[0];
		if (instance_exists(other))
		{
			originInstance = other.id
		}
		else
		{
			originInstance = noone;
		}
		if (argument_count > 1)
		{
			background = argument[1];
		}
		else
		{
			background = 1;
		}
		if (argument_count > 2)
		{
			_responses = argument[2];
			responses = array_create(array_length(_responses),"");
			_arrayIndex = 0;
			while(_arrayIndex < array_length(_responses))
			{
				responses[_arrayIndex] = string_copy(_responses[_arrayIndex], 1, string_length(_responses[_arrayIndex]));
				_arrayIndex++;
			}
			for (var i = 0; i < array_length_1d(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}
		}
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}
	}
	with (oPlayer)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state;
			state = PlayerStateLocked;
		}
	}

}
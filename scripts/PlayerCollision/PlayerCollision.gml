function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();

	// horizontal tiles
	if (tilemap_get_at_pixel(collisionMap, x + horizontalSpeed, y))
	{
		x -= x % TILE_SIZE;
		if (sign(horizontalSpeed) == 1)
		{	
			x += TILE_SIZE - 1;
		}
		horizontalSpeed = 0;
		_collision = true;
	}
	
	// horizontal entities
	var _entityCount = instance_position_list(x + horizontalSpeed, y, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0]; // == ds_list_find_value(_entityList, 0);
		if (_entityCheck.entityCollision == true)
		{
			// snap to the collided entity
			if (sign(horizontalSpeed) == -1)
			{
				_snapX = _entityCheck.bbox_right + 1;
			}
			else
			{
				_snapX = _entityCheck.bbox_left - 1;
			}
			x = _snapX;
			horizontalSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	x += horizontalSpeed;
	
	ds_list_clear(_entityList);
	
	// vertical tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + verticalSpeed))
	{
		y -= y % TILE_SIZE;
		if (sign(verticalSpeed) == 1)
		{	
			y += TILE_SIZE - 1;
		}
		verticalSpeed = 0;
		_collision = true;
	}
	// Vertical entities
	var _entityCount = instance_position_list(x, y + verticalSpeed, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0]; // == ds_list_find_value(_entityList, 0);
		if (_entityCheck.entityCollision == true)
		{
			// snap to the collided entity
			if (sign(verticalSpeed) == -1)
			{
				_snapY = _entityCheck.bbox_bottom + 1;
			}
			else
			{
				_snapY = _entityCheck.bbox_top - 1;
			}
			y = _snapY;
			verticalSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	y += verticalSpeed;

	ds_list_destroy(_entityList);
	
	
	

	return _collision;
}
if mouse_check_button_pressed(mb_left){
	with (instance_create_layer(mouse_x,mouse_y,"Instances",o_shape)){
		shapeType = SHAPE_TYPES.circle
	}
}

if mouse_check_button_pressed(mb_right){
	with (instance_create_layer(mouse_x,mouse_y,"Instances",o_shape)){
		shapeType = SHAPE_TYPES.square
	}
}

if keyboard_check_pressed(vk_space){//clear
	with(o_shape){
		instance_destroy()
	}
}

if keyboard_check_pressed(ord("Z")){//save
	var _file = "savegame.sav"
	var _numberOfShapes = instance_number(o_shape)
	
	var _buffer = buffer_create(_numberOfShapes*5,buffer_fixed,1)
	
	for (var i = 0; i < _numberOfShapes; i++){
		var _inst = instance_find(o_shape, i);
		
		buffer_write(_buffer,buffer_u16,_inst.x)
		buffer_write(_buffer,buffer_u16,_inst.y)
		buffer_write(_buffer,buffer_u8,_inst.shapeType)
	}
	buffer_save(_buffer,_file)
	buffer_delete(_buffer)
}

if keyboard_check_pressed(ord("X")){//load
	var _file = "savegame.sav"
	
	if file_exists(_file){
		var _buffer = buffer_load(_file)
		var _numberOfShapes = (buffer_get_size(_buffer)/5)
		
		for (var i = 0; i < _numberOfShapes; i++){
			var _x, _y, _shapeType
	
			_x = buffer_read(_buffer,buffer_u16)
			_y = buffer_read(_buffer,buffer_u16)
			_shapeType = buffer_read(_buffer,buffer_u8)
	
			with (instance_create_layer(_x,_y,"Instances",o_shape)){
				shapeType = _shapeType
			}
		}
		buffer_delete(_buffer)
	}
}
switch(shapeType){
	case SHAPE_TYPES.circle:{
		draw_set_color(c_red)
		draw_circle(x,y,16,false)
		draw_set_color(c_white)
	break
	}
	case SHAPE_TYPES.square:{
		draw_set_color(c_blue)
		draw_rectangle(x-16,y-16,x+16,y+16,false)
		draw_set_color(c_white)
	break
	}
	default:{
		draw_rectangle(x-16,y-16,x+16,y+16,true)
	break
	}
}
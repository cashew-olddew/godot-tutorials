shader_type canvas_item;

void vertex() {
	
	if (VERTEX.x < 0.5) {
		VERTEX += vec2(0, sin(TIME * 5.0) * 7.0);
	}
}

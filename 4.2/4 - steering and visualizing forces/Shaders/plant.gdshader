shader_type canvas_item;

void vertex() {
	
	if (VERTEX.x < 0.5) {
		VERTEX += vec2(sin(TIME * 3.0) * 3.0, 0);
	}
}

shader_type canvas_item;

uniform vec4 border_color : source_color;
uniform float border_percentage : hint_range(0.0, 0.5, 0.001);
uniform vec2 sprite_size; // Set this to the size of the sprite (width, height)

void fragment() {
    // Calculate the border thickness in both directions
	float horizontal_border;
	float vertical_border;
	float ratio = sprite_size.x / sprite_size.y;
	
	if (ratio >= 1.0) {
		horizontal_border = border_percentage / ratio;
		vertical_border = border_percentage;
	} else {
		horizontal_border = border_percentage;
		vertical_border = border_percentage * ratio;
	}

    // Apply the border color if within the border region
    if (UV.x < horizontal_border || UV.y < vertical_border || 
        UV.x > 1.0 - horizontal_border || UV.y > 1.0 - vertical_border) {
        COLOR = border_color;
    }
}

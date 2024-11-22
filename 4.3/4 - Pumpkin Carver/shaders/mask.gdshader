shader_type canvas_item;

uniform sampler2D mask_texture;
uniform vec4 color: source_color;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 mask_color = texture(mask_texture, SCREEN_UV);

	if (mask_color.rgb != vec3(1.0, 1.0, 1.0)) {
		discard;
	}
	
	vec4 original_color = texture(TEXTURE, UV);
	float brightness = (original_color.r + original_color.g + original_color.b) / 3.0;
	vec4 gray_scale = vec4(brightness, brightness, brightness, original_color.a);
	
	if (color != vec4(0.0, 0.0, 0.0, 1.0)) {
		COLOR = gray_scale * color;
	}

}
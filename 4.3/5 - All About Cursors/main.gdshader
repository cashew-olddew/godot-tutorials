shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
	vec2 uv = SCREEN_UV;
    uv.y += sin(SCREEN_UV.x * 20.0 + TIME) * 0.01;

    COLOR = texture(screen_texture, uv);
}




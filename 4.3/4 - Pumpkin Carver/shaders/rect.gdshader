shader_type canvas_item;

uniform vec4 border_color : source_color;
uniform float border_percentage : hint_range(0.0, 0.5, 0.001);

void fragment() {

    if (UV.x < border_percentage || UV.y < border_percentage || 
        UV.x > 1.0 - border_percentage || UV.y > 1.0 - border_percentage) {
        COLOR = border_color;
    }
}

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float g_value;
uniform vec4 g_uv;

vec3 hsv2rgb(vec3 c) 
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//vec2 pos = vec2(v_vTexcoord.x + g_uv[0], v_vTexcoord.y + g_uv[1]);
	float left = g_uv[0];
	float top = g_uv[1];
	float right = g_uv[2];
	float bottom = g_uv[3];
	float width = (right - left);
	float height = (bottom - top);
	float x_offset = left + (width / 2.0);
	float y_offset = top + (height / 2.0);
	
	//vec2 pos = vec2(left + v_vTexcoord.x * width, top + v_vTexcoord.y * height);
	
	float my_pi = 3.141593;
	//float m_angle = 2.0 * atan((pos.y - y_offset) / ((pos.x - x_offset) + sqrt((pos.x - x_offset) * (pos.x - x_offset) + (pos.y - y_offset) * (pos.y - y_offset))));
	float m_angle = 2.0 * atan((v_vTexcoord.y - y_offset) / ((v_vTexcoord.x - x_offset) + sqrt((v_vTexcoord.x - x_offset) * (v_vTexcoord.x - x_offset) + (v_vTexcoord.y - y_offset) * (v_vTexcoord.y - y_offset))));
	float max_angle = g_value * 360.0;
	vec3 col = hsv2rgb(vec3(m_angle / 7.0 - .6, 1.0, 1.0));
	float alpha = 1.0;
	if ((m_angle + my_pi) / (my_pi * 2.0) > g_value) 
	{
		alpha = 0.0;
	}
	
	gl_FragColor = v_vColour * vec4(col.r, col.g, col.b, gl_FragColor.a * alpha);
}

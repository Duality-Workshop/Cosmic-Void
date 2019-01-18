//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_wave;

void main()
{
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor = v_vColour * vec4(gl_FragColor.r, gl_FragColor.g+u_wave, gl_FragColor.b + u_wave, gl_FragColor.a);
}

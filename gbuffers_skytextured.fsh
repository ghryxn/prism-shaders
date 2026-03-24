#version 120

uniform sampler2D texture;

#include "/settings.glsl"

varying vec2 texcoord;
varying vec4 glcolor;

void main() {
    // sample texture and multiply by vertex stuff bla bla
    vec4 color = texture2D(texture, texcoord) * glcolor;

    #if RED_SUN == 1
    	color.g = 0;
    	color.b = 0;
    #endif

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = color; // Output to gcolor buffer
}
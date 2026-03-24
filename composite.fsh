#version 120

/*
    Prism Shaderpack - composite.fsh
*/

#define DRAW_SHADOW_MAP gcolor 

#include "/settings.glsl"
#include "/lib/color_adj.glsl"

uniform sampler2D gcolor;
uniform sampler2D shadowcolor0;
uniform sampler2D shadowtex0;
uniform sampler2D shadowtex1;

varying vec2 texcoord;

void main() {
    // 1. Sample the base color
    vec3 color = texture2D(DRAW_SHADOW_MAP, texcoord).rgb;
    
    // 2. Apply Blue Mix (Manual mix to match your style)
    color = mix(color, vec3(0.0, 0.0, 1.0), float(BLUE_AMOUNT));

    // 3. Call green function
    color = make_green(color, float(GREEN_AMOUNT));

    // 4. Grayscale adjustment
    color = make_gray(color, float(GRAY_AMOUNT));

    /* DRAWBUFFERS:0 */
    // Using simple vec4(vec3, float) which is standard for GLSL 1.20
    gl_FragData[0] = vec4(color, 1.0); 
}
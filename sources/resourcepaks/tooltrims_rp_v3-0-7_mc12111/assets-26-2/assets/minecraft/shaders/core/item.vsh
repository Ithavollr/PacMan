#version 330

#moj_import <minecraft:light.glsl>
#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>
#moj_import <minecraft:projection.glsl>
#moj_import <minecraft:sample_lightmap.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler0;
uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

out float sphericalVertexDistance;
out float cylindricalVertexDistance;
out vec4 vertexColor;
out vec4 lightMapColor;
out vec4 overlayColor;

out vec2 texCoord0;

void main() {
    // ---------------------------------------------------------
    // Note: this shader may still affect some items that are not the creative templates, the issue is minimized however
    // original code by thederdiscohund, from MCC
    // color of the texture at 1 pixel inwards from the current vertex, listing the relative positions for each corner
    ivec2[] corners = ivec2[](
        ivec2( 1, 1),
        ivec2( 1,-1),
        ivec2(-1,-1),
        ivec2(-1, 1)
    );

    ivec2 uv = ivec2(round(UV0 * vec2(textureSize(Sampler0, 0))));
    vec4 texColor = texelFetch(Sampler0, uv + corners[gl_VertexID % 4], 0);
    
    // moves the current vertex forward when it is next to a magenta color with 1/255 of alpha
    vec3 pos = Position;
    bool isTransparentMagenta = (round(texColor.a * 255.0) == 1.0) && (texColor.r == 1.0) && (texColor.b == 1.0);
    if (isTransparentMagenta) {
        pos += vec3(0.0, 0.0, -0.01);
    }
    gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);
    // ---------------------------------------------------------

    sphericalVertexDistance = fog_spherical_distance(Position);
    cylindricalVertexDistance = fog_cylindrical_distance(Position);

    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
    lightMapColor = sample_lightmap(Sampler2, UV2);
    overlayColor = texelFetch(Sampler1, UV1, 0);

    texCoord0 = UV0;
}

#version 330 core
out vec4 color;
in vec3 vertex_normal;
in vec3 vertex_pos;
in vec2 vertex_tex;
in vec3 frag_pos;
uniform vec4 lightpos;
uniform vec3 colordot;


uniform sampler2D tex_sphere;

void main()
{
vec3 n = normalize(vertex_normal);

vec3 ld = normalize(lightpos.xyz - vertex_pos);
float diffuse = dot(n,ld);

if(lightpos.w>0.5) 
	diffuse = 1;

color = texture(tex_sphere, vertex_tex) * diffuse;
color.r = color.r * colordot.r;
color.g = color.g * colordot.g;
color.b = color.b * colordot.b;
color.a = 1;//0.2;
 
// "cut"  half of the sphere away
// if(frag_pos.z<0) color.a = 0;

/*color *= diffuse*0.7;


vec3 cd = normalize(vertex_pos - campos);
vec3 h = normalize(cd+ld);
float spec = dot(n,h);
spec = clamp(spec,0,1);
spec = pow(spec,20);
color += vec4(vec3(1,1,1)*1,1.0);
 */

}

shader_type spatial;
void vertex() {
    float r = length(VERTEX.xz);
    float swirl_angle = 0.5 * sin(TIME * 2.0 + r * 5.0);
    mat2 swirl = mat2(vec2(cos(swirl_angle), -sin(swirl_angle)), vec2(sin(swirl_angle), cos(swirl_angle)));
    VERTEX.xz = swirl * VERTEX.xz;
    NORMAL.xz = swirl * NORMAL.xz;
    float wave = sin(VERTEX.x * 10.0 + TIME) * 0.1;
    VERTEX.y += wave;
    float d_wave_dx = cos(VERTEX.x * 10.0 + TIME) * 10.0 * 0.1;
    vec3 wave_normal = normalize(vec3(-d_wave_dx, 1.0, 0.0));
    NORMAL = normalize(NORMAL + wave_normal);
}
float circle(vec2 uv, vec2 center, float radius, float smoothness) {
    float d = length(uv - center);
    return smoothstep(radius, radius - smoothness, d);
}
void fragment() {
    vec2 uv = UV;
    float t = TIME;
    vec3 col = vec3(0.0);
    float burst = mod(t, 1.5);
    vec2 center = vec2(0.5 + 0.3*sin(t * 2.0), 0.5 + 0.3*cos(t * 2.0));
    float r = burst * 0.5;
    float firework = 1.0 - circle(uv, center, r, 0.005);
    col += vec3(1.0, 0.8, 0.2) * firework;
    float star = step(0.98, fract(sin(dot(uv * 50.0, vec2(12.9898, 78.233))) * 43758.5453));
    col += vec3(1.0) * star;
    ALBEDO = col;
}
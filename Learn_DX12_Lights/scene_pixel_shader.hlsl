cbuffer SceneConstantBuffer : register(b0)
{
  float4x4 model;
  float4x4 view;
  float4x4 proj;
  float4 light_world_direction_or_position;
  float4 light_color;
  float4 camera_world_pos;
  int light_type;  // 0: directional light; 1: point light; 2: spot light
};

struct PSInput {
	float4 pos : SV_POSITION;
	float3 color : COLOR;
  float3 world_pos : POSITION;
  float3 world_normal : NORMAL;
};

float4 main(PSInput ps_input) : SV_TARGET
{
  // calculate ambient color
  float3 ambient_color = 0.05f * ps_input.color;

  // calculate diffuse color
  float3 light_world_direction;
  if (light_type == 0) {
    // Note: the direction passed in points from light to surface, 
    // but dot operation needs direction to be from surface to light
    light_world_direction = -normalize(light_world_direction_or_position);
  }
  else if (light_type == 1 || light_type == 2) {
    // todo
  }
  float3 world_normal = normalize(ps_input.world_normal);
  float diff = saturate(dot(light_world_direction, world_normal));
  float3 diffuse_color = diff * ps_input.color;

  // calculate specular color
  float3 view_world_direction = normalize(camera_world_pos.xyz - ps_input.world_pos);
  float3 half_way_direction = normalize(light_world_direction + view_world_direction);
  float spec = pow(saturate(dot(world_normal, half_way_direction)), 32.0f);
  float3 specular_color = float3(0.3f, 0.3f, 0.3f) * spec;

	return float4(ambient_color + diffuse_color + specular_color, 1.0f);
}
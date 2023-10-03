#include "UnityCG.cginc"

float4 _Color;

struct appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
};

struct v2f
{
    float4 vertex : SV_POSITION;
    float2 uv : TEXCOORD0;
};

void Vertex(float4 position : POSITION,
            float2 uv : TEXCOORD0,
            out float4 out_position : SV_POSITION,
            out float2 out_uv : TEXCOORD0)
{
    out_position = UnityObjectToClipPos(position);
    out_uv = uv;
}

float4 Fragment(float4 position : SV_POSITION,
                float2 uv : TEXCOORD0) : SV_TARGET
{
    float alpha = 1 - 2.2 * length(uv.xy - 0.5);
    clip(alpha);
    return float4(_Color.rgb, saturate(alpha));
}

Shader "AlphaClip/Textured"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _AlphaThreshold("Threshold", Range(0, 1)) = 0.5
    }
    CGINCLUDE

#include "UnityCG.cginc"

sampler2D _MainTex;
float _AlphaThreshold;

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
    float4 s = tex2D(_MainTex, uv);
    clip(s.a - _AlphaThreshold);
    return s;
}

    ENDCG
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex Vertex
            #pragma fragment Fragment
            ENDCG
        }
    }
}

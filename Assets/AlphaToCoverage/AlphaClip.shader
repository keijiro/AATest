Shader "AlphaGradient/AlphaClip"
{
    Properties
    {
        _Color("Color", Color) = (1, 1, 1, 1)
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex Vertex
            #pragma fragment Fragment
            #include "AlphaGradient.cginc"
            ENDCG
        }
    }
}

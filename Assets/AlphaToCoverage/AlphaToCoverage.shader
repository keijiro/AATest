Shader "AlphaGradient/AlphaToCoverage"
{
    Properties
    {
        _Color("Color", Color) = (1, 1, 1, 1)
    }
    SubShader
    {
        Pass
        {
            AlphaToMask On
            CGPROGRAM
            #pragma vertex Vertex
            #pragma fragment Fragment
            #include "AlphaGradient.cginc"
            ENDCG
        }
    }
}

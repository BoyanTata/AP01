// Upgrade NOTE: replaced 'defined SKY_BLACK' with 'defined (SKY_BLACK)'
// Upgrade NOTE: replaced 'defined SKY_WHITE' with 'defined (SKY_WHITE)'

Shader "AP01/L24/Sky"{
    Properties {
        [NoScaleOffset]_SkyCube ("天空球", Cube) = "grey" {}
        _Rotation ("水平旋转", Range(0.0, 360.0)) = 0.0
        [HDR]_TintCol ("染色", Color) = (1.0, 1.0, 1.0, 1.0)
    }
    SubShader {
        Tags {
            "Queue"="Background"        // 调整渲染顺序
            "RenderType"="Background"   // 渲染类型改为背景
            "PreviewType"="Skybox"      // 预览类型改为天空球
        }
        Cull Off
        ZWrite Off
        
        Pass {
            Name "SKY_FORWARD"
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            // 声明分支
            #pragma shader_feature __ _BAKE_MAINLIGHT _BAKE_SKYLIGHT _BAKE_EMISSIONGI
            // 参数
            uniform samplerCUBE _SkyCube;
            uniform float _Rotation;
            uniform float3 _TintCol;
            
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;   // 顶点信息 Get✔
            };
            // 输出结构
            struct VertexOutput {
                float4 pos      : SV_POSITION;  // 屏幕顶点位置
                float3 posWS    : TEXCOORD0;    // 世界空间顶点位置
            };
            
            float3 RotateAroundYInDegrees (float3 vertex, float degrees)
            {
                float alpha = degrees * UNITY_PI / 180.0;
                float sina, cosa;
                sincos(alpha, sina, cosa);
                float2x2 m = float2x2(cosa, -sina, sina, cosa);
                return float3(mul(m, vertex.xz), vertex.y).xzy;
            }
            
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    o.pos = UnityObjectToClipPos(v.vertex);       // 顶点位置 OS>CS
                    o.posWS = RotateAroundYInDegrees(v.vertex, _Rotation);   // 顶点位置 OS>WS
                return o;                                           // 返回输出结构
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                float4 var_SkyCube = texCUBE (_SkyCube, i.posWS);
                float3 SkyCol = var_SkyCube.rgb * _TintCol;
#if defined (_BAKE_SKYLIGHT)
                SkyCol = 1.0f;
#elif defined (_BAKE_MAINLIGHT) || defined (_BAKE_EMISSIONGI)
                SkyCol = 0.0f;
#endif
                return float4(SkyCol, 1.0);
            }
            ENDCG
        }
    }
    CustomEditor "EmissionShaderGUI"
}

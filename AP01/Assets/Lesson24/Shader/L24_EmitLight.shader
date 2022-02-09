Shader "AP01/L24/EmitLight" {
    Properties {
        _MainTex ("主纹理", 2D) = "white" {}
        _EmitInt ("自发光强度", Range(0.0, 10.0)) = 1.0
    }
    SubShader {
        Tags {
            "Queue"="Transparent"               // 调整渲染顺序
            "RenderType"="Transparent"          // 对应改为Cutout
            "ForceNoShadowCasting"="True"       // 关闭阴影投射
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha     // 修改混合方式One/SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            // 声明分支
            #pragma shader_feature __ _BAKE_MAINLIGHT _BAKE_SKYLIGHT _BAKE_EMISSIONGI
            // 输入参数
            uniform sampler2D _MainTex;
            uniform float _EmitInt;
            // 全局参数
            uniform float3 _G_EmissionCol;
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                    o.pos = UnityObjectToClipPos( v.vertex);    // 顶点位置 OS>CS
                    o.uv = v.uv;                                // UV信息
                return o;
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                float opacity = tex2D(_MainTex, i.uv).r;
                float3 finalRGB = _G_EmissionCol * _EmitInt * opacity;
#if defined (_BAKE_EMISSIONGI)
                finalRGB = 1.0f;
#elif defined (_BAKE_MAINLIGHT) || defined (_BAKE_SKYLIGHT)
                finalRGB = 0.0f;
                opacity = 0.0f;
#endif
                return half4(finalRGB, opacity);
            }
            ENDCG
        }

        Pass {
            Name "META"
            Tags {
                "LightMode" = "Meta"
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "UnityMetaPass.cginc"
            // 声明分支
            #pragma shader_feature __ _BAKE_MAINLIGHT _BAKE_SKYLIGHT _BAKE_EMISSIONGI
            // 输入参数
            uniform sampler2D   _MainTex;
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;     // 顶点位置 总是必要
                float2 uv0      : TEXCOORD0;    // UV信息 采样贴图用
                float2 uv1      : TEXCOORD1;    // 其他UV信息 MetaPass需要
                float2 uv2      : TEXCOORD2;    // 同上
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                    o.pos = UnityMetaVertexPosition(v.vertex, v.uv1, v.uv2, unity_LightmapST, unity_DynamicLightmapST);
                    o.uv = v.uv0;
                return o;
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                
                float opacity = tex2D(_MainTex, i.uv).r;
                UnityMetaInput metaIN;
                    UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
                    metaIN.Albedo = 0.0f;
                    metaIN.SpecularColor = 0.0f;
#if defined (_BAKE_EMISSIONGI)
                    metaIN.Emission = opacity;
#elif defined (_BAKE_MAINLIGHT) || defined (_BAKE_SKYLIGHT)
                    metaIN.Emission = 0.0f;
#endif
                return UnityMetaFragment(metaIN);
            }
            ENDCG
        }
    }
    CustomEditor "EmissionShaderGUI"
}

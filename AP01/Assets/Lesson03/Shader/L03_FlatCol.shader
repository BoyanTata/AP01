Shader "AP01/L03/FlatCol" {
    Properties {
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }


            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型的顶点信息输入进来
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;   // 由模型顶点信息换算而来的顶点屏幕位置
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;           // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );   // 变换顶点信息 并将其塞给输出结构
                return o;                                   // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                //float3 emissive = float3(1,0.4605795,0);
                //float3 finalColor = emissive;
                //return fixed4(finalColor,1);
                return float4(0.0, 1.0, 0.0, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
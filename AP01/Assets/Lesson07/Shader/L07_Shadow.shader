Shader "AP01/L07/Shadow" {
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
            #include "AutoLight.cginc"      // 使用Unity投影必须包含这两个库文件
            #include "Lighting.cginc"       // 同上
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型的顶点信息输入进来
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;   // 由模型顶点信息换算而来的顶点屏幕位置
                LIGHTING_COORDS(0,1)        // 投影用坐标信息 Unity已封装 不用管细节
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;           // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );   // 变换顶点信息 并将其塞给输出结构
                TRANSFER_VERTEX_TO_FRAGMENT(o)              // Unity封装 不用管细节
                return o;                                   // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                float shadow = LIGHT_ATTENUATION(i);        // 同样Unity封装好的函数 可取出投影
                return float4(shadow, shadow, shadow, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
Shader "AP01/L23/EmitLight" {
    Properties {
        _MainTex        ("颜色纹理", 2D)            = "white" {}
        [HDR]_EmitCol   ("自发光颜色", Color)   = (1.0, 1.0, 1.0, 1.0)
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
            Blend SrcAlpha OneMinusSrcAlpha          // 修改混合方式One/SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            // 输入参数
            uniform sampler2D _MainTex;
            uniform float3 _EmitCol;
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
                float4 var_MainTex = tex2D(_MainTex, i.uv).r;
                float3 finalRGB = var_MainTex.rgb * _EmitCol;
                float opacity = var_MainTex.a;
                return half4(finalRGB, opacity);
            }
            ENDCG
        }
    }
}

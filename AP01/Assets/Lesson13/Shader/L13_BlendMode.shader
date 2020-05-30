Shader "AP01/L13/BlendMode" {
    Properties {
        _MainTex ("RGB：颜色 A：透贴", 2d) = "gray"{}
        _Opacity ("透明度", range(0, 1)) = 0.5
        [Enum(UnityEngine.Rendering.BlendMode)]
        _BlendSrc ("混合源乘子", int) = 0
        [Enum(UnityEngine.Rendering.BlendMode)]
        _BlendDst ("混合目标乘子", int) = 0
        [Enum(UnityEngine.Rendering.BlendOp)]
        _BlendOp ("混合算符", int) = 0
    }
    SubShader {
        Tags {
            "Queue"="Transparent"               // 调整渲染顺序
            "RenderType"="Transparent"          // 对应改为Cutout
            "ForceNoShadowCasting"="True"       // 关闭阴影投射
            "IgnoreProjector"="True"            // 不响应投射器
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            BlendOp [_BlendOp]                  // 可自定义混合算符
            Blend [_BlendSrc] [_BlendDst]       // 可自定义混合模式

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform half _Opacity;
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
                    o.uv = TRANSFORM_TEX(v.uv, _MainTex);       // UV信息 支持TilingOffset
                return o;
            }
            // 输出结构>>>像素
            half4 frag(VertexOutput i) : COLOR {
                half4 var_MainTex = tex2D(_MainTex, i.uv);      // 采样贴图 RGB颜色 A透贴不必须
                half3 finalRGB = var_MainTex.rgb;
                half opacity = var_MainTex.a * _Opacity;
                return half4(finalRGB * opacity, opacity);                // 返回值
            }
            ENDCG
        }
    }
}
Shader "AP01/L18/PolarCoord" {
    Properties {
        _MainTex    ("RGB：颜色 A：透贴", 2d)   = "gray"{}
[HDR]   _Color      ("混合颜色", color)         = (1.0, 1.0, 1.0, 1.0)
        _Opacity    ("透明度", range(0, 1))     = 0.5
        
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
            Blend One OneMinusSrcAlpha                       // 修改混合方式
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform sampler2D _MainTex;
            uniform half _Opacity;
            uniform half3 _Color;
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
                float4 color : COLOR;
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
                float4 color : COLOR;
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                    o.pos = UnityObjectToClipPos( v.vertex);    // 顶点位置 OS>CS
                    o.uv = v.uv;                                // UV信息 支持TilingOffset
                    o.color = v.color;
                return o;
            }
            // 直角坐标转极坐标方法
            float2 RectToPolar(float2 uv, float2 centerUV) {
                uv = uv - centerUV;
                float theta = atan2(uv.y, uv.x);    // atan()值域[-π/2, π/2]一般不用; atan2()值域[-π, π]
                float r = length(uv);
                return float2(theta, r);
            }

            // 输出结构>>>像素
            half4 frag(VertexOutput i) : COLOR {
                // 直角坐标转极坐标
                float2 thetaR = RectToPolar(i.uv, float2(0.5, 0.5));
                // 极坐标转纹理采样UV
                float2 polarUV = float2(
                    thetaR.x / 3.141593 * 0.5 + 0.5,    // θ映射到[0, 1]
                    thetaR.y + frac(_Time.x * 3.0)      // r随时间流动
                );
                // 采样MainTex
                half4 var_MainTex = tex2D(_MainTex, polarUV);
                // 处理最终输出
                half3 finalRGB = (1 - var_MainTex.rgb) * _Color;
                half opacity = (1 - var_MainTex.r) * _Opacity * i.color.r;
                // 返回值
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
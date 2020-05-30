Shader "AP01/L17/ScreenUV" {
    Properties {
        _MainTex ("RGB：颜色 A：透贴", 2d) = "gray"{}
        _Opacity ("透明度", range(0, 1)) = 0.5
        _ScreenTex ("屏幕纹理", 2d) = "black" {}
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
            Blend One OneMinusSrcAlpha          // 混合方式
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform sampler2D _MainTex;
            uniform half _Opacity;
            uniform sampler2D _ScreenTex;   uniform float4 _ScreenTex_ST;
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;       // 顶点位置 OS
                float2 uv : TEXCOORD0;          // UV信息
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 顶点位置 CS
                float2 uv : TEXCOORD0;          // UV信息
                float2 screenUV : TEXCOORD1;    // 屏幕UV
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                    o.pos = UnityObjectToClipPos(v.vertex);     // 顶点位置 OS>CS
                    o.uv = v.uv;                                // UV信息
                    float3 posVS = UnityObjectToViewPos(v.vertex).xyz;                  // 顶点位置 OS>VS
                    float originDist = UnityObjectToViewPos(float3(0.0, 0.0, 0.0)).z;   // 原点位置 OS>VS
                    o.screenUV = posVS.xy / posVS.z;            // VS空间畸变校正
                    o.screenUV *= originDist;                   // 纹理大小按距离锁定
                    o.screenUV = o.screenUV * _ScreenTex_ST.xy - frac(_Time.x * _ScreenTex_ST.zw);  // 启用屏幕纹理ST
                return o;
            }
            // 输出结构>>>像素
            half4 frag(VertexOutput i) : COLOR {
                half4 var_MainTex = tex2D(_MainTex, i.uv);              // 采样 基本纹理 RGB颜色 A透贴
                half var_ScreenTex = tex2D(_ScreenTex, i.screenUV).r;   // 采样 屏幕纹理
                // FinalRGB 不透明度
                half3 finalRGB = var_MainTex.rgb;
                half opacity = var_MainTex.a * _Opacity * var_ScreenTex;
                // 返回值
                return half4(finalRGB * opacity, opacity);
            }
            ENDCG
        }
    }
}
Shader "AP01/L08/NormalMap" {
    Properties {
        _NormalMap ("法线贴图", 2D) = "bump" {}
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
            // 输入参数
            uniform sampler2D _NormalMap;
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 顶点信息
                float2 uv0 : TEXCOORD0;     // 需要UV坐标 采样法线贴图
                float4 normal : NORMAL;     // 法线信息
                float4 tangent : TANGENT;   // 构建TBN矩阵 需要模型切线信息
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;     // UV信息
                float3 nDirWS : TEXCOORD1;  // 世界空间法线信息
                float3 tDirWS : TEXCOORD2;  // 世界空间切线信息
                float3 bDirWS : TEXCOORD3;  // 世界空间切线信息
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;               // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );       // 变换顶点信息 并将其塞给输出结构
                o.uv0 = v.uv0;                                  // 传递UV信息
                o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 世界空间法线信息
                o.tDirWS = normalize(mul( unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);    // 世界空间切线信息
                o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);   // 世界空间切线信息
                return o;                                       // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 获取nDir
                float3 var_NormalMap = UnpackNormal(tex2D(_NormalMap, i.uv0)).rgb;  // 采样法线纹理并解码 切线空间nDir
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);              // 构建TBN矩阵
                float3 nDir = normalize(mul(var_NormalMap, TBN));                   // 世界空间nDir
                // 获取lDir
                float3 lDir = _WorldSpaceLightPos0.xyz;
                // 一般Lambert
                float nDotl = dot(nDir, lDir);                  // nDir点积lDir
                float lambert = max(0.0, nDotl);                // 截断负值
                return float4(lambert, lambert, lambert, 1.0);  // 输出最终颜色
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
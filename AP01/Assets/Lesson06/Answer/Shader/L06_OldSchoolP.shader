Shader "AP01/L06/OldSchoolP" {
    Properties {
        _MainCol ("颜色", color) = (1.0, 1.0, 1.0, 1.0)
        _SpecularPow ("高光次幂", range(1, 90)) = 30
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
            // 修饰字（满足小朋友太多的问好, 想保发量的大家看热闹）
                // uniform  共享于vert,frag
                // attibute 仅用于vert
                // varying  用于vert,frag传数据
            uniform float3 _MainCol;     // RGB够了 float3
            uniform float _SpecularPow;  // 标量 float
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 顶点信息 Get✔
                float4 normal : NORMAL;     // 法线信息 Get✔
            };
            // 输出结构
            struct VertexOutput {
                float4 posCS : SV_POSITION;     // 裁剪空间（暂理解为屏幕空间吧）顶点位置
                float4 posWS : TEXCOORD0;       // 世界空间顶点位置
                float3 nDirWS : TEXCOORD1;      // 世界空间法线方向
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    o.posCS = UnityObjectToClipPos( v.vertex );     // 变换顶点位置 OS>CS
                    o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 变换顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 变换法线方向 OS>WS
                return o;                                           // 返回输出结构
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 准备向量
                float3 nDir = normalize(i.nDirWS);
                float3 lDir = _WorldSpaceLightPos0.xyz;
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 rDir = reflect(-lDir, nDir);
                // 准备点积结果
                float ndotl = dot(nDir, lDir);
                float vdotr = dot(vDir, rDir);
                // 光照模型
                float lambert = max(0.0, ndotl);
                float phong = pow(max(0.0, vdotr), _SpecularPow);
                float3 finalRGB = _MainCol * lambert + phong;
                // 返回结果
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
Shader "AP01/L08/OldSchoolPlus" {
    Properties {
        _BaseCol    ("基本色",      Color)          = (0.5, 0.5, 0.5, 1.0)
        _LightCol   ("光颜色",      Color)          = (1.0, 1.0, 1.0, 1.0)
        _SpecPow    ("高光次幂",    Range(1, 90))   = 30
        _Occlusion  ("AO图",        2D)             = "white" {}
        _EnvInt     ("环境光强度",  Range(0, 1))    = 0.2
        _EnvUpCol   ("环境天顶颜色", Color)          = (1.0, 1.0, 1.0, 1.0)
        _EnvSideCol ("环境水平颜色", Color)          = (0.5, 0.5, 0.5, 1.0)
        _EnvDownCol ("环境地表颜色", Color)          = (0.0, 0.0, 0.0, 0.0)
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
            // 追加投影相关包含文件
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform float3 _BaseCol;
            uniform float3 _LightCol;
            uniform float _SpecPow;
            uniform sampler2D _Occlusion;
            uniform float _EnvInt;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;   // 顶点信息 Get✔
                float4 normal   : NORMAL;     // 法线信息 Get✔
                float2 uv0      : TEXCOORD0;  // UV信息 Get✔
            };
            // 输出结构
            struct VertexOutput {
                float4 pos    : SV_POSITION;  // 裁剪空间（暂理解为屏幕空间吧）顶点位置
                float2 uv0      : TEXCOORD0;    // UV0
                float4 posWS    : TEXCOORD1;    // 世界空间顶点位置
                float3 nDirWS   : TEXCOORD2;    // 世界空间法线方向
                LIGHTING_COORDS(3,4)            // 投影相关
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    o.pos = UnityObjectToClipPos( v.vertex );       // 变换顶点位置 OS>CS
                    o.uv0 = v.uv0;                                  // 传递UV
                    o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 变换顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 变换法线方向 OS>WS
                    TRANSFER_VERTEX_TO_FRAGMENT(o)                  // 投影相关
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

                // 光照模型(直接光照部分)
                float shadow = LIGHT_ATTENUATION(i);        // 获取投影
                float lambert = max(0.0, ndotl);
                float phong = pow(max(0.0, vdotr), _SpecPow);
                float3 dirLighting = (_BaseCol * lambert + phong) * _LightCol * shadow;

                // 光照模型(环境光照部分)
                float upMask = max(0.0, nDir.g);                // 获取朝上部分遮罩
                float downMask = max(0.0, -nDir.g);             // 获取朝下部分遮罩
                float sideMask = 1.0 - upMask - downMask;       // 获取侧面部分遮罩
                // 混合环境色
                float3 envCol = _EnvUpCol * upMask + _EnvSideCol * sideMask + _EnvDownCol * downMask;
                float occlusion = tex2D(_Occlusion, i.uv0);         // 采样Occlusion贴图
                float3 envLighting = envCol * _EnvInt * occlusion;  // 计算环境光照

                // 返回结果
                float3 finalRGB = dirLighting + envLighting;
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
Shader "AP01/L20/OldSchoolAnim" {
    Properties {
        [Header(Texture)]
            _MainTex        ("RGB:基础颜色 A:环境遮罩", 2D)     = "white" {}
[Normal]    _NormTex	    ("RGB:法线贴图", 2D)                = "bump" {}
            _SpecTex        ("RGB:高光颜色 A:高光次幂", 2D)     = "gray" {}
            _EmitTex        ("RGB:环境贴图", 2d)                = "black" {}
            _Cubemap        ("RGB:环境贴图", cube)              = "_Skybox" {}
        [Header(Diffuse)]
            _MainCol        ("基本色",      Color)              = (0.5, 0.5, 0.5, 1.0)
            _EnvDiffInt     ("环境漫反射强度",  Range(0, 1))     = 0.2
            _EnvUpCol       ("环境天顶颜色", Color)             = (1.0, 1.0, 1.0, 1.0)
            _EnvSideCol     ("环境水平颜色", Color)             = (0.5, 0.5, 0.5, 1.0)
            _EnvDownCol     ("环境地表颜色", Color)             = (0.0, 0.0, 0.0, 0.0)
        [Header(Specular)]
[PowerSlider(2)] _SpecPow   ("高光次幂",    Range(1, 90))       = 30
            _EnvSpecInt     ("环境镜面反射强度", Range(0, 5))    = 0.2
            _FresnelPow     ("菲涅尔次幂", Range(0, 5))         = 1
            _CubemapMip     ("环境球Mip", Range(0, 7))          = 0
        [Header(Emission)]
            _EmitInt        ("自发光强度", range(1, 10))         = 1
        [Header(Clock)]
            _HourHandAngle      ("时针角度", range(0.0, 360.0))     = 0.0
            _MinuteHandAngle    ("分针角度", range(0.0, 360.0))     = 0.0
            _SecondHandAngle    ("秒针角度", range(0.0, 360.0))     = 0.0
            _RotateOffset       ("旋转偏移", range(0.0, 5.0))       = 0.0
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
            #include "../../Lesson11/cginc/MyCginc.cginc" 

            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            // Texture
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormTex;
            uniform sampler2D _SpecTex;
            uniform sampler2D _EmitTex;
            uniform samplerCUBE _Cubemap;
            // Diffuse
            uniform float3 _MainCol;
            uniform float _EnvDiffInt;
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            // Specular
            uniform float _SpecPow;
            uniform float _FresnelPow;
            uniform float _EnvSpecInt;
            uniform float _CubemapMip;
            // Emission
            uniform float _EmitInt;
            // Clock
            uniform float _HourHandAngle;
            uniform float _MinuteHandAngle;
            uniform float _SecondHandAngle;
            uniform float _RotateOffset;
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;   // 顶点信息 Get✔
                float2 uv0      : TEXCOORD0;  // UV信息 Get✔
                float4 normal   : NORMAL;     // 法线信息 Get✔
                float4 tangent  : TANGENT;    // 切线信息 Get✔
                float4 color    : COLOR;
            };
            // 输出结构
            struct VertexOutput {
                float4 pos    : SV_POSITION;  // 屏幕顶点位置
                float2 uv0      : TEXCOORD0;  // UV0
                float4 posWS    : TEXCOORD1;  // 世界空间顶点位置
                float3 nDirWS   : TEXCOORD2;  // 世界空间法线方向
                float3 tDirWS   : TEXCOORD3;  // 世界空间切线方向
                float3 bDirWS   : TEXCOORD4;  // 世界空间副切线方向
                LIGHTING_COORDS(5,6)          // 投影相关
            };
            // 沿偏移中心旋转顶点方法
            void RotateZWithOffset(float angle, float offset, float mask, inout float3 vertex) {
                vertex.y -= offset * mask;
                float radZ = radians(angle * mask);
                float sinZ, cosZ = 0.0;
                sincos(radZ, sinZ, cosZ);
                vertex.xy = float2(
                    vertex.x * cosZ - vertex.y * sinZ,
                    vertex.x * sinZ + vertex.y * cosZ
                );
                vertex.y += offset * mask;
            }
            // 时钟动画方法
            void ClockAnim(float3 color, inout float3 vertex) {
                RotateZWithOffset(_HourHandAngle, _RotateOffset, color.r, vertex);
                RotateZWithOffset(_MinuteHandAngle, _RotateOffset, color.g, vertex);
                RotateZWithOffset(_SecondHandAngle, _RotateOffset, color.b, vertex);
            }
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    ClockAnim(v.color.rgb, v.vertex.xyz);
                    o.pos = UnityObjectToClipPos( v.vertex);        // 顶点位置 OS>CS
                    o.uv0 = v.uv0 * _MainTex_ST.xy + _MainTex_ST.zw;                                  // 传递UV
                    o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 法线方向 OS>WS
                    o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz); // 切线方向 OS>WS
                    o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);  // 副切线方向
                    TRANSFER_VERTEX_TO_FRAGMENT(o)                  // 投影相关
                return o;                                           // 返回输出结构
            }

            // 3Col环境色方法
            float3 TriColAmbient (float3 n, float3 uCol, float3 sCol, float3 dCol) {
                float uMask = max(0.0, n.g);            // 获取朝上部分遮罩
                float dMask = max(0.0, -n.g);           // 获取朝下部分遮罩
                float sMask = 1.0 - uMask - dMask;      // 获取侧面部分遮罩
                float3 envCol = uCol * uMask +
                                sCol * sMask +
                                dCol * dMask;           // 混合环境色
                return envCol;
            }

            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 准备向量
                float3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0)).rgb;
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS.xyz);
                float3 vrDirWS = reflect(-vDirWS, nDirWS);
                float3 lDirWS = _WorldSpaceLightPos0.xyz;
                float3 lrDirWS = reflect(-lDirWS, nDirWS);

                // 准备点积结果
                float ndotl = dot(nDirWS, lDirWS);
                float vdotr = dot(vDirWS, lrDirWS);
                float vdotn = dot(vDirWS, nDirWS);

                // 采样纹理
                float4 var_MainTex = tex2D(_MainTex, i.uv0);
                float4 var_SpecTex = tex2D(_SpecTex, i.uv0);
                float3 var_EmitTex = tex2D(_EmitTex, i.uv0).rgb;
                float3 var_Cubemap = texCUBElod(_Cubemap, float4(vrDirWS, lerp(_CubemapMip, 0.0, var_SpecTex.a))).rgb;

                // 光照模型(直接光照部分)
                float3 baseCol = var_MainTex.rgb * _MainCol;
                float lambert = max(0.0, ndotl);
                float specCol = var_SpecTex.rgb;
                float specPow = lerp(1, _SpecPow, var_SpecTex.a);
                float phong = pow(max(0.0, vdotr), specPow);
                float shadow = LIGHT_ATTENUATION(i);
                float3 dirLighting = (baseCol * lambert + specCol * phong) * _LightColor0 * shadow;

                // 光照模型(环境光照部分)

                // 使用3Col环境色方法
                float3 envCol = TriColAmbient(nDirWS, _EnvUpCol, _EnvSideCol, _EnvDownCol);

                float fresnel = pow(max(0.0, 1.0 - vdotn), _FresnelPow);    // 菲涅尔
                float occlusion = var_MainTex.a;
                float3 envLighting = (baseCol * envCol * _EnvDiffInt + var_Cubemap * fresnel * _EnvSpecInt * var_SpecTex.a) * occlusion;

                // 光照模型(自发光部分)
                float3 emission = var_EmitTex * _EmitInt * (sin(_Time.z) * 0.5 + 0.5);

                // 返回结果
                float3 finalRGB = dirLighting + envLighting + emission;
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
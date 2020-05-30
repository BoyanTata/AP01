Shader "AP01/L12/Dota2" {
    Properties {
        [Header(Texture)]
        _MainTex        ("RGB:颜色 A:透贴", 2d) = "white"{}
        _MaskTex        ("R:高光强度 G:边缘光强度 B:高光染色 A:高光次幂", 2d) = "black"{}
        _NormTex        ("RGB:法线贴图", 2d) = "bump"{}
        _MatelnessMask  ("金属度遮罩", 2d) = "black"{}
        _EmissionMask   ("自发光遮罩", 2d) = "black"{}
        _DiffWarpTex    ("颜色Warp图", 2d) = "gray"{}
        _FresWarpTex    ("菲涅尔Warp图", 2d) = "gray"{}
        _Cubemap        ("环境球", cube) = "_Skybox"{}
        [Header(DirDiff)]
        _LightCol       ("光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        [Header(DirSpec)]
        _SpecPow        ("高光次幂", range(0.0, 99.0)) = 5
        _SpecInt        ("高光强度", range(0.0, 10.0)) = 5
        [Header(EnvDiff)]
        _EnvCol         ("环境光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        [Header(EnvSpec)]
        _EnvSpecInt     ("环境镜面反射强度", range(0.0, 30.0)) = 0.5
        [Header(RimLight)]
        [HDR]_RimCol    ("轮廓光颜色", color) = (1.0, 1.0, 1.0, 1.0)
        [Header(Emission)]
        _EmitInt        ("自发光强度", range(0.0, 10.0)) = 1.0
        [HideInInspector]
        _Cutoff         ("Alpha cutoff", Range(0,1)) = 0.5
        [HideInInspector]
        _Color          ("Main Color", Color) = (1.0, 1.0, 1.0, 1.0)
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
            Cull Off
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform sampler2D _MainTex;
            uniform sampler2D _MaskTex;
            uniform sampler2D _NormTex;
            uniform sampler2D _MatelnessMask;
            uniform sampler2D _EmissionMask;
            uniform sampler2D _DiffWarpTex;
            uniform sampler2D _FresWarpTex;
            uniform samplerCUBE _Cubemap;
            // DirDiff
            uniform half3 _LightCol;
            // DirSpec
            uniform half _SpecPow;
            uniform half _SpecInt;
            // EnvDiff
            uniform half3 _EnvCol;
            // EnvSpec
            uniform half _EnvSpecInt;
            // RimLight
            uniform half3 _RimCol;
            // Emission
            uniform half _EmitInt;
            // Other
            uniform half _Cutoff;
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;   // 顶点信息 Get✔
                float2 uv0      : TEXCOORD0;  // UV信息 Get✔
                float4 normal   : NORMAL;     // 法线信息 Get✔
                float4 tangent  : TANGENT;    // 切线信息 Get✔
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
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    o.pos = UnityObjectToClipPos( v.vertex );       // 顶点位置 OS>CS
                    o.uv0 = v.uv0;                                  // 传递UV
                    o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 法线方向 OS>WS
                    o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz); // 切线方向 OS>WS
                    o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);  // 副切线方向
                    TRANSFER_VERTEX_TO_FRAGMENT(o)                  // 投影相关
                return o;                                           // 返回输出结构
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 向量准备
                half3 nDirTS = UnpackNormal(tex2D(_NormTex, i.uv0));
                half3x3 TBN = half3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                half3 nDirWS = normalize(mul(nDirTS, TBN));
                half3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                half3 vrDirWS = reflect(-vDirWS, nDirWS);
                half3 lDirWS = _WorldSpaceLightPos0.xyz;
                half3 lrDirWS = reflect(-lDirWS, nDirWS);
                // 中间量准备
                half ndotl = dot(nDirWS, lDirWS);
                half ndotv = dot(nDirWS, vDirWS);
                half vdotr = dot(vDirWS, lrDirWS);
                // 采样纹理
                half4 var_MainTex = tex2D(_MainTex, i.uv0);
                half4 var_MaskTex = tex2D(_MaskTex, i.uv0);
                half var_MatelnessMask = tex2D(_MatelnessMask, i.uv0).r;
                half var_EmissionMask = tex2D(_EmissionMask, i.uv0).r;
                half3 var_FresWarpTex = tex2D(_FresWarpTex, ndotv);
                half3 var_Cubemap = texCUBElod(_Cubemap, float4(vrDirWS, lerp(8.0, 0.0, var_MaskTex.a))).rgb;
                // 提取信息
                half3 baseCol = var_MainTex.rgb;
                half opacity = var_MainTex.a;
                half specInt = var_MaskTex.r;
                half rimInt = var_MaskTex.g;
                half specTint = var_MaskTex.b;
                half specPow = var_MaskTex.a;
                half matellic = var_MatelnessMask;
                half emitInt = var_EmissionMask;
                half3 envCube = var_Cubemap;
                half shadow = LIGHT_ATTENUATION(i);
                // 光照模型
                    // 漫反射颜色 镜面反射颜色
                    half3 diffCol = lerp(baseCol, half3(0.0, 0.0, 0.0), matellic);
                    half3 specCol = lerp(baseCol, half3(0.3, 0.3, 0.3), specTint) * specInt;
                    // 菲涅尔
                    half3 fresnel = lerp(var_FresWarpTex, 0.0, matellic);
                    half fresnelCol = fresnel.r;    // 无实际用途
                    half fresnelRim = fresnel.g;
                    half fresnelSpec = fresnel.b;
                    // 光源漫反射
                    half halfLambert = ndotl * 0.5 + 0.5;
                    half3 var_DiffWarpTex = tex2D(_DiffWarpTex, half2(halfLambert, 0.2));
                    half3 dirDiff = diffCol * var_DiffWarpTex * _LightCol;
                    // 光源镜面反射
                    half phong = pow(max(0.0, vdotr), specPow * _SpecPow);
                    half spec = phong * max(0.0, ndotl);
                    spec = max(spec, fresnelSpec);
                    spec = spec * _SpecInt;
                    half3 dirSpec = specCol * spec * _LightCol;
                    // 环境漫反射
                    half3 envDiff = diffCol * _EnvCol;
                    // 环境镜面反射
                    half reflectInt = max(fresnelSpec, matellic) * specInt;
                    half3 envSpec = specCol * reflectInt * envCube * _EnvSpecInt;
                    // 轮廓光
                    half3 rimLight = _RimCol * fresnelRim * rimInt * max(0.0, nDirWS.g);
                    // 自发光
                    half3 emission = diffCol * emitInt * _EmitInt;
                    // 混合
                    half3 finalRGB = (dirDiff + dirSpec) * shadow + envDiff + envSpec + rimLight + emission;
                // 透明剪切
                clip(opacity - _Cutoff);
                // 返回值
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
    // 声明回退Shader
    FallBack "Legacy Shaders/Transparent/Cutout/VertexLit"
}
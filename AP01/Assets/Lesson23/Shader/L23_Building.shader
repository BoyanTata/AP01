Shader "AP01/L23/Building" {
    Properties {
        [Header(Texture)]
                    _MainTex        ("  颜色纹理", 2D)          = "white" {}
                    _MaskTex        ("  遮罩纹理", 2D)          = "gray" {}
                    _Lightmap       ("  光照纹理", 2D)          = "white" {}
                    _MetalDarken    ("  金属压暗", Float)       = 0.0
        [Header(MainLight)]
        [Toggle]    _MainLightOn    ("  主光开关", Float)       = 0.0
        [HDR]       _MainLightCol   ("  主光颜色", Color)       = (1.0, 1.0, 1.0, 1.0)
        [HDR]       _HalfShadowCol  ("  半影颜色", Color)       = (1.0, 1.0, 1.0, 1.0)
                    _SpecParams     ("  高光参数", Vector)      = (10.0, 1.0, 30.0, 1.0)
        [Header(MainLightGI)]
        [Toggle]    _MainLightGIOn  ("  主光GI开关", Float)     = 0.0
                    _GIInt          ("  GI强度", Float)         = 0.5
                    _GIPow          ("  GI次幂", Float)         = 1.0
                    _GICol          ("  GI颜色", Color)         = (1.0, 1.0, 1.0, 1.0)
        [Header(SkyLight)]
        [Toggle]    _SkyLightOn     ("  天光开关", Float)       = 0.0
                    _SkyCube        ("  天空球", Cube)          = "_Skybox" {}
                    _SkyLightInt    ("  天光强度", Float)       = 1.0
        [Header(EnvReflect)]
        [Toggle]    _EnvReflectOn   ("  环境反射开关", Float)   = 0.0
                    _EnvCube        ("  环境球", Cube)          = "_Skybox" {}
                    _EnvReflectParams ("  反射参数", Vector)    = (7.0, 1.0, 1.0, 0.0)
                    _FresnelPow     ("  菲涅尔次幂", Float)     = 5.0
        [Header(EmitLight)]
        [Toggle]    _EmitLightOn    ("  自发光光照开关", Float) = 0.0
        [HDR]       _EmissionCol    ("  自发光颜色", Color)     = (1.0, 1.0, 1.0, 1.0)
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
            // Texture
            uniform sampler2D   _MainTex;
            uniform sampler2D   _MaskTex;
            uniform sampler2D   _Lightmap;
            uniform float       _MetalDarken;
            // MainLight
            uniform float       _MainLightOn;
            uniform float3      _MainLightCol;
            uniform float4      _HalfShadowCol;
            uniform float4      _SpecParams;
            // MainLightGI
            uniform float       _MainLightGIOn;
            uniform float       _GIInt;
            uniform float       _GIPow;
            uniform float3      _GICol;
            // SkyLight
            uniform float       _SkyLightOn;
            uniform samplerCUBE _SkyCube;
            uniform float       _SkyLightInt;
            // EnvReflect
            uniform float       _EnvReflectOn;
            uniform samplerCUBE _EnvCube;
            uniform float4      _EnvReflectParams;
            uniform float       _FresnelPow;
            // EmitLight
            uniform float       _EmitLightOn;
            uniform float3      _EmissionCol;
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;   // 顶点信息 Get✔
                float2 uv0      : TEXCOORD0;  // UV信息 Get✔
                float2 uv1      : TEXCOORD1;  // UV信息 Get✔
                float4 normal   : NORMAL;     // 法线信息 Get✔
                float4 tangent  : TANGENT;    // 切线信息 Get✔
            };
            // 输出结构
            struct VertexOutput {
                float4 pos    : SV_POSITION;  // 屏幕顶点位置
                float4 uvs      : TEXCOORD0;  // UV0
                float4 posWS    : TEXCOORD1;  // 世界空间顶点位置
                float3 nDirWS   : TEXCOORD2;  // 世界空间法线方向
                float3 tDirWS   : TEXCOORD3;  // 世界空间切线方向
                float3 bDirWS   : TEXCOORD4;  // 世界空间副切线方向
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    o.pos = UnityObjectToClipPos( v.vertex );       // 顶点位置 OS>CS
                    o.uvs = float4(v.uv0, v.uv1);                   // 传递UV
                    o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 法线方向 OS>WS
                    o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz); // 切线方向 OS>WS
                    o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);  // 副切线方向
                return o;                                           // 返回输出结构
            }
            // 法线信息解码方法
            float3 DecodeNormal(float2 maskXY) {
                float2 nDirTSxy = maskXY * 2.0 - 1.0;
                float nDirTSz = sqrt(1.0 - nDirTSxy.x * nDirTSxy.x + nDirTSxy.y * nDirTSxy.y);
                return float3(nDirTSxy, nDirTSz);
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 采样纹理2D
                float3 var_MainTex = tex2D(_MainTex, i.uvs.xy).rgb;
                float4 var_MaskTex = tex2D(_MaskTex, i.uvs.xy);
                float4 var_LightMap = tex2D(_Lightmap, i.uvs.zw);
                // 向量准备
                float3 nDirTS = DecodeNormal(var_MaskTex.zw);
                float3x3 TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3 nDirWS = normalize(mul(nDirTS, TBN));
                float3 vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 vrDirWS = reflect(-vDirWS, nDirWS);
                float3 lDirWS = _WorldSpaceLightPos0.xyz;
                float3 lrDirWS = reflect(-lDirWS, nDirWS);
                // 中间量准备
                float ndotl = dot(nDirWS, lDirWS);
                float ndotv = dot(nDirWS, vDirWS);
                float vdotr = dot(vDirWS, lrDirWS);
                // 提取表面信息
                float occlusion = var_MaskTex.r;
                float matMask = var_MaskTex.g;
                float3 diffCol = var_MainTex.rgb * lerp(1.0, _MetalDarken, pow(matMask, 5.0));
                float specPow = max(1.0, lerp(_SpecParams.x, _SpecParams.z, matMask));
                float specInt = max(0.0, lerp(_SpecParams.y, _SpecParams.w, matMask));
                float reflectMip = clamp(lerp(_EnvReflectParams.x, _EnvReflectParams.z, matMask), 0.0, 7.0);
                float reflectInt = max(0.0, lerp(_EnvReflectParams.y, _EnvReflectParams.w, matMask));
                float fresnel = lerp(pow(1.0 - max(0.0, ndotv), _FresnelPow), 1.0, matMask);
                // 提取光照信息
                float skyLightOcc = var_LightMap.r;
                float emitLightingInt = var_LightMap.g;
                float mainLightGIInt = pow(var_LightMap.b, _GIPow);
                float mainLightShadow = var_LightMap.a;
                // 采样纹理Cube
                float3 var_SkyCube = texCUBElod(_SkyCube, float4(vrDirWS, 7.0)).rgb;
                float3 var_EnvCube = texCUBElod(_EnvCube, float4(vrDirWS, reflectMip)).rgb;
                // 光照模型
                // MainLight
                    // Diff
                    float3 halfShadowCol = lerp(_HalfShadowCol.rgb, _MainLightCol, mainLightShadow);
                    float3 mainLightCol = lerp(_MainLightCol, halfShadowCol, _HalfShadowCol.a) * mainLightShadow;
                    float3 mainLightDiff = diffCol * mainLightCol * max(0.0, ndotl);
                    // Spec
                    float3 mainLightSpec = mainLightCol * pow(max(0.0, vdotr), specPow) * specInt;
                    // GI
                    float3 mainLightGI = _GICol * occlusion * mainLightGIInt * _GIInt;
                    // 混合
                    float3 mainLight = (mainLightDiff + mainLightSpec + mainLightGI * _MainLightGIOn) * _MainLightOn;
                // OtherLight
                    // Diff
                    float3 skyLightDiff = diffCol * var_SkyCube * _SkyLightInt * skyLightOcc * occlusion;
                    float3 emitLightDiff = diffCol * _EmissionCol * emitLightingInt * occlusion;
                    // Spec
                    float3 envLightSpec = var_EnvCube * reflectInt * fresnel * occlusion;
                    // 混合
                    float3 OtherLight = skyLightDiff * _SkyLightOn + emitLightDiff * _EmitLightOn + envLightSpec * _EnvReflectOn;
                // 返回值
                float3 finalRGB = mainLight + OtherLight;
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
}

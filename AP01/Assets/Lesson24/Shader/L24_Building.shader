// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

Shader "AP01/L24/Building" {
    Properties {
        _MainTex ("颜色纹理", 2D) = "white" {}
        _MaskTex ("遮罩纹理", 2D) = "gray" {}
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
            //Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            // 声明分支
            #pragma shader_feature __ _BAKE_MAINLIGHT _BAKE_SKYLIGHT _BAKE_EMISSIONGI
            // 输入纹理
            uniform sampler2D   _MainTex;
            uniform sampler2D   _MaskTex;
            // 全局变量
            uniform float       _G_MetalDarken;
            uniform float3      _G_MainLightCol;
            uniform float4      _G_SpecParams;
            uniform float       _G_SkyLightInt;
            uniform float4      _G_ReflectParams;
            uniform float       _G_FresnelPow;
            uniform float3      _G_EmissionCol;
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
                float4 pos      : SV_POSITION;// 屏幕顶点位置
                float4 uvs      : TEXCOORD0;  // UV0
                float4 posWS    : TEXCOORD1;  // 世界空间顶点位置
                float3 nDirWS   : TEXCOORD2;  // 世界空间法线方向
                float3 tDirWS   : TEXCOORD3;  // 世界空间切线方向
                float3 bDirWS   : TEXCOORD4;  // 世界空间副切线方向
                LIGHTING_COORDS(5,6)          // 投影相关
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                // 计算Lightmap UV
                float2 lmUV = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                VertexOutput o = (VertexOutput)0;                   // 新建输出结构
                    o.pos = UnityObjectToClipPos( v.vertex );       // 顶点位置 OS>CS
                    o.uvs = float4(v.uv0, lmUV);                    // 传递UV
                    o.posWS = mul(unity_ObjectToWorld, v.vertex);   // 顶点位置 OS>WS
                    o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 法线方向 OS>WS
                    o.tDirWS = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz); // 切线方向 OS>WS
                    o.bDirWS = normalize(cross(o.nDirWS, o.tDirWS) * v.tangent.w);  // 副切线方向
                    TRANSFER_VERTEX_TO_FRAGMENT(o)                  // 投影相关
                return o;                                           // 返回输出结构
            }
            // 法线信息解码方法
            float3 DecodeNormal(float2 maskXY) {
                float2 nDirTSxy = maskXY * 2.0 - 1.0;
                float nDirTSz = sqrt(1.0 - nDirTSxy.x * nDirTSxy.x + nDirTSxy.y * nDirTSxy.y);
                return float3(nDirTSxy, nDirTSz);
            }
            float4 SampleCubeMap(UNITY_ARGS_TEXCUBE(cube), float3 r, float mip)
            {
                return UNITY_SAMPLE_TEXCUBE_LOD(cube, r, mip);
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 采样纹理
                float3      var_MainTex = tex2D(_MainTex, i.uvs.xy).rgb;
                float4      var_MaskTex = tex2D(_MaskTex, i.uvs.xy);
                // 向量准备
                float3      nDirTS = DecodeNormal(var_MaskTex.zw);
                float3x3    TBN = float3x3(i.tDirWS, i.bDirWS, i.nDirWS);
                float3      nDirWS = normalize(mul(nDirTS, TBN));
                float3      vDirWS = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3      vrDirWS = reflect(-vDirWS, nDirWS);
                float3      lDirWS = _WorldSpaceLightPos0.xyz;
                float3      lrDirWS = reflect(-lDirWS, nDirWS);
                // 中间量准备
                float       ndotl = dot(nDirWS, lDirWS);
                float       ndotv = dot(nDirWS, vDirWS);
                float       vdotr = dot(vDirWS, lrDirWS);
                // 提取表面信息
                float       occlusion = var_MaskTex.r;
                float       matMask = var_MaskTex.g;
                float3      diffCol = var_MainTex.rgb * lerp(1.0, _G_MetalDarken, pow(matMask, 5.0));
                float       specPow = max(1.0, lerp(_G_SpecParams.x, _G_SpecParams.z, matMask));
                float       specInt = max(0.0, lerp(_G_SpecParams.y, _G_SpecParams.w, matMask));
                float       reflectMip = clamp(lerp(_G_ReflectParams.x, _G_ReflectParams.z, matMask), 0.0, 7.0);
                float       reflectInt = max(0.0, lerp(_G_ReflectParams.y, _G_ReflectParams.w, matMask));
                float       fresnel = lerp(pow(1.0 - max(0.0, ndotv), _G_FresnelPow), 1.0, matMask);
                // 采集环境信息
                float3 skyLight = ShadeSH9(float4(nDirWS, 1.0f)) * _G_SkyLightInt;
                float3 envReflect = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, vrDirWS, reflectMip) * reflectInt;
#if defined(LIGHTMAP_ON)
                // 提取lightmap
                float4 var_LightMap  = UNITY_SAMPLE_TEX2D(unity_Lightmap, i.uvs.zw);
                float  mainLightInt  = var_LightMap.r;
                float  skyLightInt   = var_LightMap.g;
                float  emissionGIInt = var_LightMap.b;
#else
                float  mainLightInt  = LIGHT_ATTENUATION(i);
                float  skyLightInt   = 0.0f;
                float  emissionGIInt = 0.0f;
#endif
                // 光照模型
                // MainLight
                    // Diff
                    float3 mainLightDiff = diffCol;
                    // Spec
                    float mainLightSpec = pow(max(0.0, vdotr), specPow) * specInt;
                    // 混合
                    float3 mainLight = (mainLightDiff + mainLightSpec) * _G_MainLightCol * mainLightInt;
                // OtherLight
                    // Diff
                    float3 skyLightDiff = diffCol * skyLight * skyLightInt * occlusion;
                    // Spec
                    float3 envLightSpec = envReflect * reflectInt * fresnel * occlusion;
                    // Emit
                    float3 emitLightDiff = diffCol * _G_EmissionCol * emissionGIInt * occlusion;
                    // 混合
                    float3 OtherLight = skyLightDiff + emitLightDiff + envLightSpec;
                // 返回值
                float3 finalRGB = mainLight + OtherLight;
                // Debug
#if defined(LIGHTMAP_ON)
    #if defined (_BAKE_MAINLIGHT)
                finalRGB = mainLightInt;
    #elif defined (_BAKE_SKYLIGHT)
                finalRGB = skyLightInt;
    #elif defined (_BAKE_EMISSIONGI)
                finalRGB = emissionGIInt;
    #endif
#endif
                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
        Pass {
            Name "META"
            Tags {
                "LightMode" = "Meta"
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "UnityMetaPass.cginc"
            // 声明分支
            #pragma shader_feature __ _BAKE_MAINLIGHT _BAKE_SKYLIGHT _BAKE_EMISSIONGI
            // 输入参数
            uniform sampler2D   _MainTex;
            // 输入结构
            struct VertexInput {
                float4 vertex   : POSITION;     // 顶点位置 总是必要
                float2 uv0      : TEXCOORD0;    // UV信息 采样贴图用
                float2 uv1      : TEXCOORD1;    // 其他UV信息 MetaPass需要
                float2 uv2      : TEXCOORD2;    // 同上
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;       // 顶点位置 总是必要
                float2 uv : TEXCOORD0;          // UV信息 采样贴图用
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                    o.pos = UnityMetaVertexPosition(v.vertex, v.uv1, v.uv2, unity_LightmapST, unity_DynamicLightmapST);
                    o.uv = v.uv0;
                return o;
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                UnityMetaInput metaIN;
                    UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
                    metaIN.Albedo = Luminance(tex2D(_MainTex, i.uv).rgb);
                    metaIN.SpecularColor = 0.0f;
                    metaIN.Emission = 0.0f;
                return UnityMetaFragment(metaIN);
            }
            ENDCG
        }
        
        Pass
        {
            Name "ShadowCaster"
            Tags { "LightMode" = "ShadowCaster" }

            ZWrite On ZTest LEqual Cull off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_shadowcaster
            #include "UnityCG.cginc"

            struct v2f {
                V2F_SHADOW_CASTER;
            };

            v2f vert( appdata_base v )
            {
                v2f o;
                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
                return o;
            }

            float4 frag( v2f i ) : SV_Target
            {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
}

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33088,y:32600,varname:node_3138,prsc:2|emission-3752-OUT,olwid-1698-OUT,olcol-5143-RGB;n:type:ShaderForge.SFN_LightVector,id:5905,x:31275,y:33223,varname:node_5905,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:6235,x:31275,y:33057,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:4875,x:31444,y:33137,varname:node_4875,prsc:2,dt:0|A-6235-OUT,B-5905-OUT;n:type:ShaderForge.SFN_Slider,id:280,x:30958,y:32744,ptovrint:False,ptlb:_DispersionInt 色散强度,ptin:__DispersionInt,varname:node_280,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5816852,max:1;n:type:ShaderForge.SFN_Multiply,id:9951,x:32376,y:32552,varname:node_9951,prsc:2|A-8793-OUT,B-2733-OUT;n:type:ShaderForge.SFN_Color,id:6572,x:31992,y:32379,ptovrint:False,ptlb:LightCol 亮部颜色,ptin:_LightCol,varname:node_6572,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7169812,c2:0.7000712,c3:0.7000712,c4:1;n:type:ShaderForge.SFN_ScreenPos,id:9561,x:31816,y:33364,varname:node_9561,prsc:2,sctp:0;n:type:ShaderForge.SFN_Tex2d,id:4712,x:32156,y:33440,ptovrint:False,ptlb:HatchTex 排线纹理,ptin:_HatchTex,varname:node_4712,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-2432-OUT;n:type:ShaderForge.SFN_Multiply,id:2432,x:31987,y:33440,varname:node_2432,prsc:2|A-9561-UVOUT,B-2275-OUT;n:type:ShaderForge.SFN_Depth,id:2275,x:31816,y:33529,varname:node_2275,prsc:2;n:type:ShaderForge.SFN_Vector1,id:1698,x:32895,y:32911,varname:node_1698,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Multiply,id:5861,x:31276,y:32790,varname:node_5861,prsc:2|A-280-OUT,B-8062-RGB;n:type:ShaderForge.SFN_Color,id:8062,x:31115,y:32862,ptovrint:False,ptlb:DispersionCol 色散频率,ptin:_DispersionCol,varname:node_8062,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5143,x:32895,y:33020,ptovrint:False,ptlb:OutlineCol 描边颜色,ptin:_OutlineCol,varname:node_5143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2735849,c2:0.13034,c3:0.13034,c4:1;n:type:ShaderForge.SFN_ComponentMask,id:1266,x:31444,y:32644,varname:node_1266,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-5861-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5233,x:31444,y:32790,varname:node_5233,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-5861-OUT;n:type:ShaderForge.SFN_ComponentMask,id:5347,x:31444,y:32943,varname:node_5347,prsc:2,cc1:2,cc2:-1,cc3:-1,cc4:-1|IN-5861-OUT;n:type:ShaderForge.SFN_Step,id:4916,x:31623,y:32644,varname:node_4916,prsc:2|A-1266-OUT,B-4875-OUT;n:type:ShaderForge.SFN_Step,id:4678,x:31623,y:32800,varname:node_4678,prsc:2|A-5233-OUT,B-4875-OUT;n:type:ShaderForge.SFN_Step,id:7010,x:31623,y:32953,varname:node_7010,prsc:2|A-5347-OUT,B-4875-OUT;n:type:ShaderForge.SFN_Append,id:3345,x:31830,y:32550,varname:node_3345,prsc:2|A-4916-OUT,B-4678-OUT;n:type:ShaderForge.SFN_Append,id:8793,x:31992,y:32550,cmnt:色散效果 便于理解 拆开Step,varname:node_8793,prsc:2|A-3345-OUT,B-7010-OUT;n:type:ShaderForge.SFN_Color,id:1018,x:32184,y:32379,ptovrint:False,ptlb:DarkCol 暗部颜色,ptin:_DarkCol,varname:_LightCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7169812,c2:0.7000712,c3:0.7000712,c4:1;n:type:ShaderForge.SFN_Min,id:8598,x:31830,y:32694,varname:node_8598,prsc:2|A-4916-OUT,B-4678-OUT;n:type:ShaderForge.SFN_Min,id:3287,x:31992,y:32694,cmnt:亮部遮罩,varname:node_3287,prsc:2|A-8598-OUT,B-7010-OUT;n:type:ShaderForge.SFN_Max,id:3557,x:31830,y:32849,varname:node_3557,prsc:2|A-4916-OUT,B-4678-OUT;n:type:ShaderForge.SFN_Max,id:8440,x:31992,y:32849,varname:node_8440,prsc:2|A-3557-OUT,B-7010-OUT;n:type:ShaderForge.SFN_OneMinus,id:8811,x:32154,y:32849,cmnt:暗部遮罩,varname:node_8811,prsc:2|IN-8440-OUT;n:type:ShaderForge.SFN_Multiply,id:2636,x:32219,y:32694,varname:node_2636,prsc:2|A-6572-RGB,B-3287-OUT;n:type:ShaderForge.SFN_Multiply,id:1888,x:32374,y:32849,varname:node_1888,prsc:2|A-1018-RGB,B-8811-OUT;n:type:ShaderForge.SFN_Add,id:9485,x:32540,y:32745,varname:node_9485,prsc:2|A-2636-OUT,B-1888-OUT;n:type:ShaderForge.SFN_Add,id:155,x:32713,y:32597,varname:node_155,prsc:2|A-9951-OUT,B-9485-OUT;n:type:ShaderForge.SFN_Max,id:2860,x:31992,y:33009,varname:node_2860,prsc:2|A-3287-OUT,B-8811-OUT;n:type:ShaderForge.SFN_OneMinus,id:2733,x:32154,y:33009,cmnt:色散部分遮罩,varname:node_2733,prsc:2|IN-2860-OUT;n:type:ShaderForge.SFN_Add,id:1235,x:31652,y:33203,varname:node_1235,prsc:2|A-1266-OUT,B-5233-OUT;n:type:ShaderForge.SFN_Add,id:2459,x:31829,y:33179,varname:node_2459,prsc:2|A-4916-OUT,B-4678-OUT;n:type:ShaderForge.SFN_Add,id:8163,x:31991,y:33179,varname:node_8163,prsc:2|A-2459-OUT,B-7010-OUT;n:type:ShaderForge.SFN_Multiply,id:9361,x:32154,y:33179,cmnt:搞个灰度图,varname:node_9361,prsc:2|A-8163-OUT,B-504-OUT;n:type:ShaderForge.SFN_Vector1,id:504,x:31991,y:33334,varname:node_504,prsc:2,v1:0.33334;n:type:ShaderForge.SFN_Lerp,id:5395,x:32378,y:33352,cmnt:排线,varname:node_5395,prsc:2|A-4712-RGB,B-7172-OUT,T-9361-OUT;n:type:ShaderForge.SFN_Vector3,id:7172,x:32156,y:33613,varname:node_7172,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Multiply,id:3752,x:32895,y:32699,varname:node_3752,prsc:2|A-155-OUT,B-5395-OUT;proporder:8062-280-6572-4712-5143-1018;pass:END;sub:END;*/

Shader "AP01/L04/T01" {
    Properties {
        _DispersionCol ("DispersionCol 色散频率", Color) = (0.5,0.5,0.5,1)
        __DispersionInt ("_DispersionInt 色散强度", Range(0, 1)) = 0.5816852
        _LightCol ("LightCol 亮部颜色", Color) = (0.7169812,0.7000712,0.7000712,1)
        _HatchTex ("HatchTex 排线纹理", 2D) = "white" {}
        _OutlineCol ("OutlineCol 描边颜色", Color) = (0.2735849,0.13034,0.13034,1)
        _DarkCol ("DarkCol 暗部颜色", Color) = (0.7169812,0.7000712,0.7000712,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _OutlineCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*0.01,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _OutlineCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutlineCol );
                return fixed4(_OutlineCol_var.rgb,0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _HatchTex; uniform float4 _HatchTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, __DispersionInt)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DispersionCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float __DispersionInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, __DispersionInt );
                float4 _DispersionCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DispersionCol );
                float3 node_5861 = (__DispersionInt_var*_DispersionCol_var.rgb);
                float node_1266 = node_5861.r;
                float node_4875 = dot(i.normalDir,lightDirection);
                float node_4916 = step(node_1266,node_4875);
                float node_5233 = node_5861.g;
                float node_4678 = step(node_5233,node_4875);
                float node_7010 = step(node_5861.b,node_4875);
                float node_3287 = min(min(node_4916,node_4678),node_7010); // 亮部遮罩
                float node_8811 = (1.0 - max(max(node_4916,node_4678),node_7010)); // 暗部遮罩
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float4 _DarkCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DarkCol );
                float2 node_2432 = ((sceneUVs * 2 - 1).rg*partZ);
                float4 _HatchTex_var = tex2D(_HatchTex,TRANSFORM_TEX(node_2432, _HatchTex));
                float3 emissive = (((float3(float2(node_4916,node_4678),node_7010)*(1.0 - max(node_3287,node_8811)))+((_LightCol_var.rgb*node_3287)+(_DarkCol_var.rgb*node_8811)))*lerp(_HatchTex_var.rgb,float3(1,1,1),(((node_4916+node_4678)+node_7010)*0.33334)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _HatchTex; uniform float4 _HatchTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, __DispersionInt)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DispersionCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

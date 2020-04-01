// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32580,y:31578,varname:node_3138,prsc:2|emission-6550-OUT;n:type:ShaderForge.SFN_Dot,id:1691,x:30849,y:31302,varname:node_1691,prsc:2,dt:0|A-253-OUT,B-4189-OUT;n:type:ShaderForge.SFN_LightVector,id:8935,x:30664,y:31990,varname:node_8935,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:739,x:30664,y:31791,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:2189,x:31035,y:31302,varname:node_2189,prsc:2|A-1691-OUT,B-3425-OUT;n:type:ShaderForge.SFN_Add,id:4532,x:31213,y:31302,varname:node_4532,prsc:2|A-2189-OUT,B-3425-OUT;n:type:ShaderForge.SFN_Tex2d,id:1344,x:31582,y:31302,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:_node_9487,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-512-OUT;n:type:ShaderForge.SFN_Append,id:512,x:31391,y:31302,varname:node_512,prsc:2|A-4532-OUT,B-3425-OUT;n:type:ShaderForge.SFN_Vector1,id:3425,x:31035,y:31461,varname:node_3425,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Fresnel,id:9119,x:31944,y:32085,varname:node_9119,prsc:2|EXP-9077-OUT;n:type:ShaderForge.SFN_Vector1,id:9077,x:31750,y:32119,varname:node_9077,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:40,x:32132,y:32196,varname:node_40,prsc:2|A-9119-OUT,B-2451-RGB;n:type:ShaderForge.SFN_Color,id:2451,x:31944,y:32303,ptovrint:False,ptlb:FresnelCol,ptin:_FresnelCol,varname:_node_1060,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Dot,id:892,x:31380,y:31996,varname:node_892,prsc:2,dt:0|A-3101-OUT,B-8935-OUT;n:type:ShaderForge.SFN_If,id:5393,x:31584,y:31996,varname:node_5393,prsc:2|A-892-OUT,B-5905-OUT,GT-5885-OUT,EQ-9940-OUT,LT-9940-OUT;n:type:ShaderForge.SFN_Color,id:705,x:31958,y:31653,ptovrint:False,ptlb:HightlightCol,ptin:_HightlightCol,varname:_node_705,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9079778,c2:0.9333333,c3:0.7812,c4:1;n:type:ShaderForge.SFN_Dot,id:3603,x:31380,y:31722,varname:node_3603,prsc:2,dt:0|A-2545-OUT,B-8935-OUT;n:type:ShaderForge.SFN_If,id:3782,x:31584,y:31722,varname:node_3782,prsc:2|A-3603-OUT,B-7307-OUT,GT-5885-OUT,EQ-9940-OUT,LT-9940-OUT;n:type:ShaderForge.SFN_Vector1,id:9940,x:31380,y:31654,varname:node_9940,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:5885,x:31202,y:31654,varname:node_5885,prsc:2,v1:1;n:type:ShaderForge.SFN_Blend,id:6550,x:32398,y:31946,varname:node_6550,prsc:2,blmd:6,clmp:True|SRC-712-OUT,DST-40-OUT;n:type:ShaderForge.SFN_Normalize,id:2545,x:31202,y:31722,varname:node_2545,prsc:2|IN-7592-OUT;n:type:ShaderForge.SFN_Normalize,id:3101,x:31202,y:31996,varname:node_3101,prsc:2|IN-7450-OUT;n:type:ShaderForge.SFN_Vector4Property,id:7483,x:30664,y:31626,ptovrint:False,ptlb:HighlightOffset1,ptin:_HighlightOffset1,cmnt:高光偏移1,varname:node_7483,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Vector4Property,id:637,x:30836,y:31626,ptovrint:False,ptlb:HighlightOffset2,ptin:_HighlightOffset2,cmnt:高光偏移2,varname:_node_7483_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:0,v4:0;n:type:ShaderForge.SFN_Add,id:7592,x:31024,y:31722,cmnt:一般用Add,varname:node_7592,prsc:2|A-7483-XYZ,B-739-OUT;n:type:ShaderForge.SFN_Add,id:7450,x:31024,y:31996,varname:node_7450,prsc:2|A-637-XYZ,B-739-OUT;n:type:ShaderForge.SFN_Slider,id:7307,x:31223,y:31905,ptovrint:False,ptlb:HightlightRange1,ptin:_HightlightRange1,cmnt:高光范围1,varname:node_7307,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.6,cur:0.8,max:1;n:type:ShaderForge.SFN_Slider,id:5905,x:31223,y:32180,ptovrint:False,ptlb:HightlightRange2,ptin:_HightlightRange2,cmnt:高光范围2,varname:_HightlightRange2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.6,cur:0.8,max:1;n:type:ShaderForge.SFN_Max,id:3762,x:31773,y:31856,cmnt:用Max更好,varname:node_3762,prsc:2|A-3782-OUT,B-5393-OUT;n:type:ShaderForge.SFN_Clamp01,id:8229,x:31958,y:31856,cmnt:限制01,varname:node_8229,prsc:2|IN-3762-OUT;n:type:ShaderForge.SFN_Lerp,id:712,x:32197,y:31619,varname:node_712,prsc:2|A-1344-RGB,B-705-RGB,T-8229-OUT;n:type:ShaderForge.SFN_NormalVector,id:253,x:30668,y:31203,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:4189,x:30668,y:31371,varname:node_4189,prsc:2;proporder:1344-2451-705-7483-637-7307-5905;pass:END;sub:END;*/

Shader "AP01/L02/T01" {
    Properties {
        _RampTex ("RampTex", 2D) = "white" {}
        _FresnelCol ("FresnelCol", Color) = (1,1,1,1)
        _HightlightCol ("HightlightCol", Color) = (0.9079778,0.9333333,0.7812,1)
        _HighlightOffset1 ("HighlightOffset1", Vector) = (0,0,0,0)
        _HighlightOffset2 ("HighlightOffset2", Vector) = (0,0,0,0)
        _HightlightRange1 ("HightlightRange1", Range(0.6, 1)) = 0.8
        _HightlightRange2 ("HightlightRange2", Range(0.6, 1)) = 0.8
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HightlightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset2)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange1)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange2)
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
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_3425 = 0.5;
                float2 node_512 = float2(((dot(i.normalDir,lightDirection)*node_3425)+node_3425),node_3425);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_512, _RampTex));
                float4 _HightlightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HightlightCol );
                float4 _HighlightOffset1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighlightOffset1 ); // 高光偏移1
                float _HightlightRange1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HightlightRange1 ); // 高光范围1
                float node_3782_if_leA = step(dot(normalize((_HighlightOffset1_var.rgb+i.normalDir)),lightDirection),_HightlightRange1_var);
                float node_3782_if_leB = step(_HightlightRange1_var,dot(normalize((_HighlightOffset1_var.rgb+i.normalDir)),lightDirection));
                float node_9940 = 0.0;
                float node_5885 = 1.0;
                float4 _HighlightOffset2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HighlightOffset2 ); // 高光偏移2
                float _HightlightRange2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _HightlightRange2 ); // 高光范围2
                float node_5393_if_leA = step(dot(normalize((_HighlightOffset2_var.rgb+i.normalDir)),lightDirection),_HightlightRange2_var);
                float node_5393_if_leB = step(_HightlightRange2_var,dot(normalize((_HighlightOffset2_var.rgb+i.normalDir)),lightDirection));
                float4 _FresnelCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelCol );
                float3 emissive = saturate((1.0-(1.0-lerp(_RampTex_var.rgb,_HightlightCol_var.rgb,saturate(max(lerp((node_3782_if_leA*node_9940)+(node_3782_if_leB*node_5885),node_9940,node_3782_if_leA*node_3782_if_leB),lerp((node_5393_if_leA*node_9940)+(node_5393_if_leB*node_5885),node_9940,node_5393_if_leA*node_5393_if_leB)))))*(1.0-(pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0)*_FresnelCol_var.rgb))));
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
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HightlightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset1)
                UNITY_DEFINE_INSTANCED_PROP( float4, _HighlightOffset2)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange1)
                UNITY_DEFINE_INSTANCED_PROP( float, _HightlightRange2)
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
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
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

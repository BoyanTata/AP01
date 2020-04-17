// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32546,y:32809,varname:node_3138,prsc:2|emission-4066-OUT;n:type:ShaderForge.SFN_Transform,id:4380,x:31233,y:32718,cmnt:nDirVS,varname:node_4380,prsc:2,tffrom:0,tfto:3|IN-9414-XYZ;n:type:ShaderForge.SFN_Tex2d,id:4963,x:30891,y:32892,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_4963,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Vector1,id:6409,x:31400,y:32859,varname:node_6409,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:3516,x:31754,y:32718,ptovrint:False,ptlb:Matcap,ptin:_Matcap,varname:node_3516,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:630f164e44edb4d848a0fc4d010cfb42,ntxv:1,isnm:False|UVIN-2148-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6081,x:31400,y:32718,varname:node_6081,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4380-XYZ;n:type:ShaderForge.SFN_Multiply,id:5040,x:32076,y:32800,varname:node_5040,prsc:2|A-3516-RGB,B-6280-OUT;n:type:ShaderForge.SFN_Fresnel,id:6280,x:31896,y:32895,varname:node_6280,prsc:2|NRM-9414-XYZ,EXP-900-OUT;n:type:ShaderForge.SFN_Slider,id:900,x:31573,y:32987,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_900,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Transform,id:9414,x:31058,y:32892,cmnt:nDirWS 简单连法,varname:node_9414,prsc:2,tffrom:2,tfto:0|IN-4963-RGB;n:type:ShaderForge.SFN_Multiply,id:4066,x:32232,y:32902,varname:node_4066,prsc:2|A-5040-OUT,B-6441-OUT;n:type:ShaderForge.SFN_Slider,id:3161,x:31896,y:33067,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_3161,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_RemapRange,id:2148,x:31573,y:32718,varname:node_2148,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-6081-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:32,x:31989,y:33215,varname:node_32,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:6441,x:32168,y:33171,varname:node_6441,prsc:2,frmn:0,frmx:1,tomn:0.5,tomx:1|IN-32-OUT;proporder:4963-3516-900-3161;pass:END;sub:END;*/

Shader "AP01/L09/Matcap_SF" {
    Properties {
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Matcap ("Matcap", 2D) = "gray" {}
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 1
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_9414 = mul( _NormalMap_var.rgb, tangentTransform ).xyz; // nDirWS 简单连法
                float2 node_2148 = (mul( UNITY_MATRIX_V, float4(node_9414.rgb,0) ).xyz.rgb.rg*0.5+0.5);
                float4 _Matcap_var = tex2D(_Matcap,TRANSFORM_TEX(node_2148, _Matcap));
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float3 emissive = ((_Matcap_var.rgb*pow(1.0-max(0,dot(node_9414.rgb, viewDirection)),_FresnelPow_var))*(attenuation*0.5+0.5));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

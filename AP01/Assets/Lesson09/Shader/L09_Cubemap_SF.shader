// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32723,y:33102,varname:node_3138,prsc:2|emission-6154-OUT;n:type:ShaderForge.SFN_Cubemap,id:6896,x:32214,y:33012,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_6896,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:d51cd34544212c54fad1d1ed41ff1d59,pvfc:0|DIR-4237-OUT,MIP-508-OUT;n:type:ShaderForge.SFN_Tex2d,id:7047,x:31602,y:33009,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_7047,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2db422f013c37b4e9d26b6605513ab8,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:2073,x:31757,y:33009,cmnt:nDirWS 简易连法,varname:node_2073,prsc:2,tffrom:2,tfto:0|IN-7047-RGB;n:type:ShaderForge.SFN_ViewVector,id:1647,x:31602,y:32765,varname:node_1647,prsc:2;n:type:ShaderForge.SFN_Reflect,id:4237,x:31923,y:32914,cmnt:vrDir,varname:node_4237,prsc:2|A-9449-OUT,B-2073-XYZ;n:type:ShaderForge.SFN_Multiply,id:9449,x:31757,y:32831,cmnt:-vDir,varname:node_9449,prsc:2|A-1647-OUT,B-3155-OUT;n:type:ShaderForge.SFN_Vector1,id:3155,x:31602,y:32896,varname:node_3155,prsc:2,v1:-1;n:type:ShaderForge.SFN_Slider,id:508,x:31896,y:33085,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_508,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Fresnel,id:5895,x:32214,y:33175,varname:node_5895,prsc:2|NRM-2073-XYZ,EXP-8891-OUT;n:type:ShaderForge.SFN_Slider,id:8891,x:31896,y:33230,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_8891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:5180,x:32386,y:33094,varname:node_5180,prsc:2|A-6896-RGB,B-5895-OUT;n:type:ShaderForge.SFN_Multiply,id:6154,x:32545,y:33201,varname:node_6154,prsc:2|A-5180-OUT,B-9178-OUT;n:type:ShaderForge.SFN_Slider,id:9178,x:32214,y:33331,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_9178,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2,max:5;proporder:6896-7047-508-8891-9178;pass:END;sub:END;*/

Shader "AP01/L09/Cubemap_SF" {
    Properties {
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _CubemapMip ("CubemapMip", Range(0, 7)) = 0
        _FresnelPow ("FresnelPow", Range(0, 10)) = 1
        _EnvSpecInt ("EnvSpecInt", Range(0, 5)) = 0.2
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform samplerCUBE _Cubemap;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _CubemapMip)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvSpecInt)
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
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 node_2073 = mul( _NormalMap_var.rgb, tangentTransform ).xyz; // nDirWS 简易连法
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((texCUBElod(_Cubemap,float4(reflect((viewDirection*(-1.0)),node_2073.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_2073.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

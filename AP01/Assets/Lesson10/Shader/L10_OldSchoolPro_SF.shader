// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33140,y:33703,varname:node_3138,prsc:2|emission-7818-OUT;n:type:ShaderForge.SFN_Reflect,id:5876,x:31056,y:33378,cmnt:rDir,varname:node_5876,prsc:2|A-300-OUT,B-9315-XYZ;n:type:ShaderForge.SFN_LightVector,id:9223,x:30735,y:33434,cmnt:lDirWS,varname:node_9223,prsc:2;n:type:ShaderForge.SFN_Dot,id:9095,x:31219,y:33691,cmnt:r dot v,varname:node_9095,prsc:2,dt:0|A-5876-OUT,B-98-OUT;n:type:ShaderForge.SFN_Multiply,id:300,x:30894,y:33378,varname:node_300,prsc:2|A-3337-OUT,B-9223-OUT;n:type:ShaderForge.SFN_Vector1,id:3337,x:30735,y:33346,varname:node_3337,prsc:2,v1:-1;n:type:ShaderForge.SFN_Power,id:5599,x:31854,y:33259,cmnt:Phong Specular,varname:node_5599,prsc:2|VAL-3056-OUT,EXP-1224-OUT;n:type:ShaderForge.SFN_Slider,id:1224,x:31509,y:33317,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_14,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:29.22609,max:90;n:type:ShaderForge.SFN_Dot,id:6081,x:31219,y:33492,cmnt:n dot l,varname:node_6081,prsc:2,dt:0|A-9223-OUT,B-9315-XYZ;n:type:ShaderForge.SFN_Add,id:4312,x:32036,y:33174,varname:node_4312,prsc:2|A-7259-OUT,B-5599-OUT;n:type:ShaderForge.SFN_Add,id:7818,x:32966,y:33804,varname:node_7818,prsc:2|A-1061-OUT,B-4849-OUT;n:type:ShaderForge.SFN_Tex2d,id:4379,x:32586,y:34438,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt:环境遮挡,varname:node_5840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4849,x:32770,y:34533,cmnt:环境部分结果,varname:node_4849,prsc:2|A-4379-RGB,B-6100-OUT;n:type:ShaderForge.SFN_Color,id:7093,x:31654,y:33059,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_4419,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:7259,x:31854,y:33059,cmnt:Lambert Diffuse,varname:node_7259,prsc:2|A-7093-RGB,B-9805-OUT;n:type:ShaderForge.SFN_Color,id:9983,x:32036,y:33005,ptovrint:False,ptlb:LightCol,ptin:_LightCol,cmnt:光源颜色,varname:_node_4419_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:894,x:32231,y:33174,varname:node_894,prsc:2|A-9983-RGB,B-4312-OUT;n:type:ShaderForge.SFN_Multiply,id:1061,x:32408,y:33174,cmnt:光源部分结果,varname:node_1061,prsc:2|A-2551-OUT,B-894-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:2551,x:32231,y:33029,cmnt:光源遮挡,varname:node_2551,prsc:2;n:type:ShaderForge.SFN_ComponentMask,id:9052,x:31060,y:34203,varname:node_9052,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-9315-XYZ;n:type:ShaderForge.SFN_Multiply,id:3107,x:31231,y:34429,varname:node_3107,prsc:2|A-9052-OUT,B-3310-OUT;n:type:ShaderForge.SFN_Vector1,id:3310,x:31060,y:34429,varname:node_3310,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:9154,x:31231,y:34203,cmnt:向上部分遮罩,varname:node_9154,prsc:2|A-9052-OUT,B-9924-OUT;n:type:ShaderForge.SFN_Max,id:5609,x:31400,y:34429,cmnt:向下部分遮罩,varname:node_5609,prsc:2|A-3107-OUT,B-9924-OUT;n:type:ShaderForge.SFN_Vector1,id:9924,x:31060,y:34360,varname:node_9924,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:6423,x:31231,y:34360,varname:node_6423,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:5792,x:31400,y:34272,varname:node_5792,prsc:2|A-6423-OUT,B-9154-OUT;n:type:ShaderForge.SFN_Subtract,id:38,x:31575,y:34272,cmnt:侧面部分遮罩,varname:node_38,prsc:2|A-5792-OUT,B-5609-OUT;n:type:ShaderForge.SFN_Color,id:5098,x:31060,y:34043,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_7783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5095,x:31746,y:34133,varname:node_5095,prsc:2|A-5098-RGB,B-9154-OUT;n:type:ShaderForge.SFN_Multiply,id:8201,x:31746,y:34415,varname:node_8201,prsc:2|A-1411-RGB,B-5609-OUT;n:type:ShaderForge.SFN_Color,id:1411,x:31400,y:34043,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:_node_7783_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:9175,x:31746,y:34272,varname:node_9175,prsc:2|A-7032-RGB,B-38-OUT;n:type:ShaderForge.SFN_Color,id:7032,x:31231,y:34043,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_node_7783_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.490566,c2:0.490566,c3:0.490566,c4:1;n:type:ShaderForge.SFN_Add,id:3027,x:31928,y:34219,varname:node_3027,prsc:2|A-5095-OUT,B-8201-OUT;n:type:ShaderForge.SFN_Add,id:7729,x:32085,y:34345,cmnt:混合三重环境光,varname:node_7729,prsc:2|A-3027-OUT,B-9175-OUT;n:type:ShaderForge.SFN_Multiply,id:7738,x:32258,y:34409,cmnt:环境光强度,varname:node_7738,prsc:2|A-7729-OUT,B-6407-OUT;n:type:ShaderForge.SFN_Slider,id:6407,x:31928,y:34504,ptovrint:False,ptlb:EnvInt,ptin:_EnvInt,varname:node_4431,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1188119,max:1;n:type:ShaderForge.SFN_Multiply,id:455,x:32422,y:34409,cmnt:3Col Env Diffuse,varname:node_455,prsc:2|A-7093-RGB,B-7738-OUT;n:type:ShaderForge.SFN_Tex2d,id:7201,x:30568,y:33589,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,cmnt:nDirTS,varname:node_7201,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Transform,id:9315,x:30735,y:33589,cmnt:nDirWS,varname:node_9315,prsc:2,tffrom:2,tfto:0|IN-7201-RGB;n:type:ShaderForge.SFN_Cubemap,id:6431,x:32086,y:34664,ptovrint:False,ptlb:Cubemap,ptin:_Cubemap,varname:node_6896,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,cube:d51cd34544212c54fad1d1ed41ff1d59,pvfc:0|DIR-5118-OUT,MIP-1825-OUT;n:type:ShaderForge.SFN_ViewVector,id:98,x:30735,y:33781,cmnt:vDirWS,varname:node_98,prsc:2;n:type:ShaderForge.SFN_Reflect,id:5118,x:31057,y:33840,cmnt:vrDir,varname:node_5118,prsc:2|A-48-OUT,B-9315-XYZ;n:type:ShaderForge.SFN_Multiply,id:48,x:30891,y:33840,cmnt:-vDir,varname:node_48,prsc:2|A-98-OUT,B-3722-OUT;n:type:ShaderForge.SFN_Vector1,id:3722,x:30735,y:33913,varname:node_3722,prsc:2,v1:-1;n:type:ShaderForge.SFN_Slider,id:1825,x:31768,y:34737,ptovrint:False,ptlb:CubemapMip,ptin:_CubemapMip,varname:node_508,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:7;n:type:ShaderForge.SFN_Fresnel,id:1595,x:32086,y:34827,varname:node_1595,prsc:2|NRM-9315-XYZ,EXP-8236-OUT;n:type:ShaderForge.SFN_Slider,id:8236,x:31768,y:34882,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_8891,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:8581,x:32258,y:34746,varname:node_8581,prsc:2|A-6431-RGB,B-1595-OUT;n:type:ShaderForge.SFN_Multiply,id:1939,x:32417,y:34853,cmnt:Cubemap Env Specular,varname:node_1939,prsc:2|A-8581-OUT,B-72-OUT;n:type:ShaderForge.SFN_Slider,id:72,x:32086,y:34983,ptovrint:False,ptlb:EnvSpecInt,ptin:_EnvSpecInt,varname:node_9178,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2,max:5;n:type:ShaderForge.SFN_Add,id:6100,x:32586,y:34619,varname:node_6100,prsc:2|A-455-OUT,B-1939-OUT;n:type:ShaderForge.SFN_Clamp01,id:3056,x:31382,y:33691,varname:node_3056,prsc:2|IN-9095-OUT;n:type:ShaderForge.SFN_Clamp01,id:9805,x:31382,y:33492,varname:node_9805,prsc:2|IN-6081-OUT;proporder:1224-4379-7093-9983-5098-1411-7032-6407-7201-6431-1825-8236-72;pass:END;sub:END;*/

Shader "AP01/L10/OldSchoolPro_SF" {
    Properties {
        _SpecPow ("SpecPow", Range(1, 90)) = 29.22609
        _Occlusion ("Occlusion", 2D) = "white" {}
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _LightCol ("LightCol", Color) = (1,1,1,1)
        _EnvUpCol ("EnvUpCol", Color) = (1,1,1,1)
        _EnvDownCol ("EnvDownCol", Color) = (0,0,0,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.490566,0.490566,0.490566,1)
        _EnvInt ("EnvInt", Range(0, 1)) = 0.1188119
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _Cubemap ("Cubemap", Cube) = "_Skybox" {}
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform samplerCUBE _Cubemap;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol ); // 光源颜色
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap))); // nDirTS
                float3 node_9315 = mul( _NormalMap_var.rgb, tangentTransform ).xyz; // nDirWS
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); // 环境遮挡
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_9052 = node_9315.rgb.g;
                float node_9924 = 0.0;
                float node_9154 = max(node_9052,node_9924); // 向上部分遮罩
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float node_5609 = max((node_9052*(-1.0)),node_9924); // 向下部分遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float _EnvInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvInt );
                float _CubemapMip_var = UNITY_ACCESS_INSTANCED_PROP( Props, _CubemapMip );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float _EnvSpecInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSpecInt );
                float3 emissive = ((attenuation*(_LightCol_var.rgb*((_BaseCol_var.rgb*saturate(dot(lightDirection,node_9315.rgb)))+pow(saturate(dot(reflect(((-1.0)*lightDirection),node_9315.rgb),viewDirection)),_SpecPow_var))))+(_Occlusion_var.rgb*((_BaseCol_var.rgb*((((_EnvUpCol_var.rgb*node_9154)+(_EnvDownCol_var.rgb*node_5609))+(_EnvSideCol_var.rgb*((1.0-node_9154)-node_5609)))*_EnvInt_var))+((texCUBElod(_Cubemap,float4(reflect((viewDirection*(-1.0)),node_9315.rgb),_CubemapMip_var)).rgb*pow(1.0-max(0,dot(node_9315.rgb, viewDirection)),_FresnelPow_var))*_EnvSpecInt_var))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

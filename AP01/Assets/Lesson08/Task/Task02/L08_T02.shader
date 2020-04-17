// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34983,y:36556,varname:node_3138,prsc:2|emission-3095-OUT;n:type:ShaderForge.SFN_NormalVector,id:7042,x:32450,y:35669,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:785,x:32635,y:35669,varname:node_785,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-7042-OUT;n:type:ShaderForge.SFN_Power,id:5591,x:33142,y:35669,varname:node_5591,prsc:2|VAL-5286-OUT,EXP-2620-OUT;n:type:ShaderForge.SFN_Multiply,id:1340,x:32795,y:35745,varname:node_1340,prsc:2|A-785-OUT,B-3509-OUT;n:type:ShaderForge.SFN_Vector1,id:3509,x:32635,y:35839,varname:node_3509,prsc:2,v1:-1;n:type:ShaderForge.SFN_Clamp01,id:5286,x:32950,y:35669,varname:node_5286,prsc:2|IN-785-OUT;n:type:ShaderForge.SFN_Clamp01,id:9131,x:32950,y:35819,varname:node_9131,prsc:2|IN-1340-OUT;n:type:ShaderForge.SFN_Slider,id:2620,x:32793,y:35569,ptovrint:False,ptlb:TopRange,ptin:_TopRange,varname:node_2620,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Power,id:2394,x:33142,y:35819,varname:node_2394,prsc:2|VAL-9131-OUT,EXP-7620-OUT;n:type:ShaderForge.SFN_Slider,id:7620,x:32793,y:35983,ptovrint:False,ptlb:BottomRange,ptin:_BottomRange,varname:node_7620,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Color,id:3606,x:33142,y:35156,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_3606,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:3758,x:33142,y:35339,ptovrint:False,ptlb:TopCol,ptin:_TopCol,varname:node_3758,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Color,id:3224,x:33142,y:35514,ptovrint:False,ptlb:BottomCol,ptin:_BottomCol,varname:node_3224,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:4181,x:33334,y:35492,varname:node_4181,prsc:2|A-3606-RGB,B-3758-RGB,T-5591-OUT;n:type:ShaderForge.SFN_Lerp,id:8298,x:33488,y:35622,varname:node_8298,prsc:2|A-4181-OUT,B-3224-RGB,T-2394-OUT;n:type:ShaderForge.SFN_Tex2d,id:2205,x:33673,y:35681,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,varname:node_2205,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:626,x:33673,y:35506,ptovrint:False,ptlb:OccCol,ptin:_OccCol,varname:node_626,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:8738,x:33842,y:35861,varname:node_8738,prsc:2|A-626-RGB,B-9265-OUT,T-2205-R;n:type:ShaderForge.SFN_ViewReflectionVector,id:4645,x:33503,y:36572,varname:node_4645,prsc:2;n:type:ShaderForge.SFN_LightVector,id:9135,x:33503,y:36722,varname:node_9135,prsc:2;n:type:ShaderForge.SFN_Dot,id:4569,x:33670,y:36647,varname:node_4569,prsc:2,dt:0|A-4645-OUT,B-9135-OUT;n:type:ShaderForge.SFN_Color,id:1071,x:34003,y:36797,ptovrint:False,ptlb:SpceCol,ptin:_SpceCol,varname:node_1071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:418,x:33679,y:36834,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_418,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_Power,id:3070,x:34003,y:36647,varname:node_3070,prsc:2|VAL-5725-OUT,EXP-418-OUT;n:type:ShaderForge.SFN_Clamp01,id:5725,x:33836,y:36647,varname:node_5725,prsc:2|IN-4569-OUT;n:type:ShaderForge.SFN_Multiply,id:1116,x:34176,y:36647,varname:node_1116,prsc:2|A-3070-OUT,B-1071-RGB;n:type:ShaderForge.SFN_Fresnel,id:5141,x:34363,y:37057,varname:node_5141,prsc:2|EXP-2963-OUT;n:type:ShaderForge.SFN_Slider,id:2963,x:34043,y:37084,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_2963,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:90;n:type:ShaderForge.SFN_Multiply,id:4369,x:34546,y:37057,varname:node_4369,prsc:2|A-5141-OUT,B-3793-RGB;n:type:ShaderForge.SFN_Color,id:3793,x:34363,y:37217,ptovrint:False,ptlb:FresnelCol,ptin:_FresnelCol,varname:node_3793,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Fresnel,id:6346,x:33144,y:36085,varname:node_6346,prsc:2|EXP-1012-OUT;n:type:ShaderForge.SFN_OneMinus,id:2250,x:33305,y:36085,varname:node_2250,prsc:2|IN-6346-OUT;n:type:ShaderForge.SFN_Slider,id:1012,x:32820,y:36112,ptovrint:False,ptlb:BonePow,ptin:_BonePow,varname:node_1012,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:2;n:type:ShaderForge.SFN_Color,id:4466,x:33305,y:36242,ptovrint:False,ptlb:BoneCol,ptin:_BoneCol,varname:node_4466,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1603774,c2:0.1603774,c3:0.1603774,c4:1;n:type:ShaderForge.SFN_Blend,id:9265,x:33673,y:35861,varname:node_9265,prsc:2,blmd:1,clmp:True|SRC-8298-OUT,DST-7566-OUT;n:type:ShaderForge.SFN_Vector3,id:1674,x:33305,y:36405,varname:node_1674,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Lerp,id:7566,x:33485,y:36085,varname:node_7566,prsc:2|A-4466-RGB,B-1674-OUT,T-6346-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:7087,x:34000,y:36141,varname:node_7087,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1523,x:34355,y:35987,varname:node_1523,prsc:2|A-8738-OUT,B-1928-OUT;n:type:ShaderForge.SFN_Lerp,id:1928,x:34171,y:36141,varname:node_1928,prsc:2|A-8453-OUT,B-7087-OUT,T-4403-OUT;n:type:ShaderForge.SFN_Vector3,id:8453,x:34000,y:36051,varname:node_8453,prsc:2,v1:1,v2:1,v3:1;n:type:ShaderForge.SFN_Slider,id:4403,x:33843,y:36298,ptovrint:False,ptlb:ShadowInt,ptin:_ShadowInt,varname:node_4403,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Slider,id:267,x:35970,y:40389,ptovrint:False,ptlb:TopRange_copy_copy,ptin:_TopRange_copy_copy,varname:_TopRange_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Add,id:7171,x:34562,y:36302,varname:node_7171,prsc:2|A-1523-OUT,B-3536-OUT;n:type:ShaderForge.SFN_Multiply,id:3536,x:34350,y:36647,varname:node_3536,prsc:2|A-7087-OUT,B-1116-OUT;n:type:ShaderForge.SFN_Add,id:3095,x:34786,y:36660,varname:node_3095,prsc:2|A-7171-OUT,B-4369-OUT;proporder:2620-3606-3758-7620-3224-2205-626-1071-418-2963-3793-1012-4466-4403;pass:END;sub:END;*/

Shader "AP01/L08/Task02" {
    Properties {
        _TopRange ("TopRange", Range(0, 10)) = 1
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _TopCol ("TopCol", Color) = (1,1,1,1)
        _BottomRange ("BottomRange", Range(0, 10)) = 1
        _BottomCol ("BottomCol", Color) = (0,0,0,1)
        _Occlusion ("Occlusion", 2D) = "white" {}
        _OccCol ("OccCol", Color) = (0.5,0.5,0.5,1)
        _SpceCol ("SpceCol", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow", Range(1, 90)) = 30
        _FresnelPow ("FresnelPow", Range(1, 90)) = 1
        _FresnelCol ("FresnelCol", Color) = (0.5,0.5,0.5,1)
        _BonePow ("BonePow", Range(0, 2)) = 1
        _BoneCol ("BoneCol", Color) = (0.1603774,0.1603774,0.1603774,1)
        _ShadowInt ("ShadowInt", Range(0, 1)) = 0.5
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _TopRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _BottomRange)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _TopCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BottomCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _OccCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpceCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _BonePow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BoneCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _ShadowInt)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _OccCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OccCol );
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float4 _TopCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TopCol );
                float node_785 = i.normalDir.g;
                float _TopRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _TopRange );
                float4 _BottomCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BottomCol );
                float _BottomRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BottomRange );
                float3 node_8298 = lerp(lerp(_BaseCol_var.rgb,_TopCol_var.rgb,pow(saturate(node_785),_TopRange_var)),_BottomCol_var.rgb,pow(saturate((node_785*(-1.0))),_BottomRange_var));
                float4 _BoneCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BoneCol );
                float _BonePow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BonePow );
                float node_6346 = pow(1.0-max(0,dot(normalDirection, viewDirection)),_BonePow_var);
                float3 node_9265 = saturate((node_8298*lerp(_BoneCol_var.rgb,float3(1,1,1),node_6346)));
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion));
                float3 node_8738 = lerp(_OccCol_var.rgb,node_9265,_Occlusion_var.r);
                float _ShadowInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ShadowInt );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _SpceCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpceCol );
                float3 node_1116 = (pow(saturate(dot(viewReflectDirection,lightDirection)),_SpecPow_var)*_SpceCol_var.rgb);
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float4 _FresnelCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelCol );
                float3 node_4369 = (pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPow_var)*_FresnelCol_var.rgb);
                float3 emissive = (((node_8738*lerp(float3(1,1,1),float3(attenuation,attenuation,attenuation),_ShadowInt_var))+(attenuation*node_1116))+node_4369);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

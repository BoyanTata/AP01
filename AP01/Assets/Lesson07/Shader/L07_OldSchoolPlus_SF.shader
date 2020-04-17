// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33426,y:33415,varname:node_3138,prsc:2|emission-4937-OUT;n:type:ShaderForge.SFN_Reflect,id:5687,x:31813,y:33274,cmnt:rDir,varname:node_5687,prsc:2|A-4227-OUT,B-6035-OUT;n:type:ShaderForge.SFN_NormalVector,id:6035,x:31650,y:33367,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:5991,x:31488,y:33151,varname:node_5991,prsc:2;n:type:ShaderForge.SFN_ViewVector,id:5354,x:31813,y:33421,varname:node_5354,prsc:2;n:type:ShaderForge.SFN_Dot,id:2600,x:31973,y:33338,cmnt:r dot v,varname:node_2600,prsc:2,dt:0|A-5687-OUT,B-5354-OUT;n:type:ShaderForge.SFN_Multiply,id:4227,x:31650,y:33212,varname:node_4227,prsc:2|A-5991-OUT,B-540-OUT;n:type:ShaderForge.SFN_Vector1,id:540,x:31488,y:33294,varname:node_540,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:8629,x:32138,y:33408,varname:node_8629,prsc:2|A-2600-OUT,B-4213-OUT;n:type:ShaderForge.SFN_Vector1,id:4213,x:31973,y:33516,varname:node_4213,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:4962,x:32303,y:33408,cmnt:Phong Specular,varname:node_4962,prsc:2|VAL-8629-OUT,EXP-195-OUT;n:type:ShaderForge.SFN_Slider,id:195,x:31949,y:33622,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_14,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:29.22609,max:90;n:type:ShaderForge.SFN_Dot,id:2717,x:31929,y:32848,varname:node_2717,prsc:2,dt:0|A-4958-OUT,B-5760-OUT;n:type:ShaderForge.SFN_Max,id:8055,x:32095,y:32917,cmnt: Lambert Diffuse,varname:node_8055,prsc:2|A-2717-OUT,B-9165-OUT;n:type:ShaderForge.SFN_Vector1,id:9165,x:31929,y:33012,varname:node_9165,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:1689,x:32485,y:33092,varname:node_1689,prsc:2|A-6918-OUT,B-4962-OUT;n:type:ShaderForge.SFN_Add,id:4937,x:33211,y:33519,varname:node_4937,prsc:2|A-187-OUT,B-8067-OUT;n:type:ShaderForge.SFN_Tex2d,id:5840,x:32812,y:33958,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt:环境遮挡,varname:node_5840,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:8067,x:32989,y:34055,cmnt:环境部分结果,varname:node_8067,prsc:2|A-5840-RGB,B-8174-OUT;n:type:ShaderForge.SFN_Color,id:4419,x:32095,y:32748,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_4419,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:6918,x:32290,y:32819,varname:node_6918,prsc:2|A-4419-RGB,B-8055-OUT;n:type:ShaderForge.SFN_LightVector,id:5760,x:31752,y:32939,varname:node_5760,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:4958,x:31752,y:32774,prsc:2,pt:False;n:type:ShaderForge.SFN_Color,id:7499,x:32672,y:32954,ptovrint:False,ptlb:LightCol,ptin:_LightCol,cmnt:光源颜色,varname:_node_4419_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1516,x:32839,y:33066,varname:node_1516,prsc:2|A-7499-RGB,B-1689-OUT;n:type:ShaderForge.SFN_Multiply,id:187,x:33013,y:33066,cmnt:光源部分结果,varname:node_187,prsc:2|A-5884-OUT,B-1516-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:5884,x:32839,y:32932,cmnt:光源遮挡,varname:node_5884,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:3284,x:31101,y:34003,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:8222,x:31271,y:34003,varname:node_8222,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-3284-OUT;n:type:ShaderForge.SFN_Multiply,id:5671,x:31442,y:34229,varname:node_5671,prsc:2|A-8222-OUT,B-5637-OUT;n:type:ShaderForge.SFN_Vector1,id:5637,x:31271,y:34229,varname:node_5637,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:5286,x:31442,y:34003,cmnt:向上部分遮罩,varname:node_5286,prsc:2|A-8222-OUT,B-3105-OUT;n:type:ShaderForge.SFN_Max,id:3113,x:31611,y:34229,cmnt:向下部分遮罩,varname:node_3113,prsc:2|A-5671-OUT,B-3105-OUT;n:type:ShaderForge.SFN_Vector1,id:3105,x:31271,y:34160,varname:node_3105,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:4698,x:31442,y:34160,varname:node_4698,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:4886,x:31611,y:34072,varname:node_4886,prsc:2|A-4698-OUT,B-5286-OUT;n:type:ShaderForge.SFN_Subtract,id:4053,x:31786,y:34072,cmnt:侧面部分遮罩,varname:node_4053,prsc:2|A-4886-OUT,B-3113-OUT;n:type:ShaderForge.SFN_Color,id:7783,x:31611,y:33884,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_7783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1644,x:32144,y:33980,varname:node_1644,prsc:2|A-7783-RGB,B-5286-OUT;n:type:ShaderForge.SFN_Multiply,id:6132,x:32144,y:34262,varname:node_6132,prsc:2|A-8962-RGB,B-3113-OUT;n:type:ShaderForge.SFN_Color,id:8962,x:31961,y:33884,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:_node_7783_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:4418,x:32144,y:34119,varname:node_4418,prsc:2|A-5347-RGB,B-4053-OUT;n:type:ShaderForge.SFN_Color,id:5347,x:31786,y:33884,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_node_7783_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.490566,c2:0.490566,c3:0.490566,c4:1;n:type:ShaderForge.SFN_Add,id:4776,x:32314,y:34066,varname:node_4776,prsc:2|A-1644-OUT,B-6132-OUT;n:type:ShaderForge.SFN_Add,id:8392,x:32472,y:34173,cmnt:混合三重环境色,varname:node_8392,prsc:2|A-4776-OUT,B-4418-OUT;n:type:ShaderForge.SFN_Multiply,id:6999,x:32641,y:34173,cmnt:可控强度,varname:node_6999,prsc:2|A-8392-OUT,B-4431-OUT;n:type:ShaderForge.SFN_Slider,id:4431,x:32315,y:34332,ptovrint:False,ptlb:EnvInt,ptin:_EnvInt,varname:node_4431,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1188119,max:1;n:type:ShaderForge.SFN_Multiply,id:8174,x:32809,y:34162,cmnt:叠加基础色影响,varname:node_8174,prsc:2|A-4419-RGB,B-6999-OUT;proporder:4419-7499-195-5840-4431-7783-5347-8962;pass:END;sub:END;*/

Shader "AP01/L07/OldSchoolPlus_SF" {
    Properties {
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
        _LightCol ("LightCol", Color) = (1,1,1,1)
        _SpecPow ("SpecPow", Range(1, 90)) = 29.22609
        _Occlusion ("Occlusion", 2D) = "white" {}
        _EnvInt ("EnvInt", Range(0, 1)) = 0.1188119
        _EnvUpCol ("EnvUpCol", Color) = (1,1,1,1)
        _EnvSideCol ("EnvSideCol", Color) = (0.490566,0.490566,0.490566,1)
        _EnvDownCol ("EnvDownCol", Color) = (0,0,0,1)
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
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvInt)
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
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol ); // 光源颜色
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); // 环境遮挡
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_8222 = i.normalDir.g;
                float node_3105 = 0.0;
                float node_5286 = max(node_8222,node_3105); // 向上部分遮罩
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float node_3113 = max((node_8222*(-1.0)),node_3105); // 向下部分遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float _EnvInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvInt );
                float3 emissive = ((attenuation*(_LightCol_var.rgb*((_BaseCol_var.rgb*max(dot(i.normalDir,lightDirection),0.0))+pow(max(dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection),0.0),_SpecPow_var))))+(_Occlusion_var.rgb*(_BaseCol_var.rgb*((((_EnvUpCol_var.rgb*node_5286)+(_EnvDownCol_var.rgb*node_3113))+(_EnvSideCol_var.rgb*((1.0-node_5286)-node_3113)))*_EnvInt_var))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

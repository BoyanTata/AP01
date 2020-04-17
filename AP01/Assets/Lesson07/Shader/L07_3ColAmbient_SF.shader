// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32096,y:33112,varname:node_3138,prsc:2|emission-5156-OUT;n:type:ShaderForge.SFN_Tex2d,id:3604,x:31691,y:32998,ptovrint:False,ptlb:Occlusion,ptin:_Occlusion,cmnt:环境遮挡,varname:_Occlusion_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:5156,x:31865,y:33084,varname:node_5156,prsc:2|A-3604-RGB,B-6285-OUT;n:type:ShaderForge.SFN_NormalVector,id:2074,x:30505,y:33058,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:1374,x:30675,y:33058,varname:node_1374,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2074-OUT;n:type:ShaderForge.SFN_Multiply,id:5008,x:30846,y:33284,varname:node_5008,prsc:2|A-1374-OUT,B-1627-OUT;n:type:ShaderForge.SFN_Vector1,id:1627,x:30675,y:33284,varname:node_1627,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:523,x:30846,y:33058,cmnt:向上部分遮罩,varname:node_523,prsc:2|A-1374-OUT,B-9475-OUT;n:type:ShaderForge.SFN_Max,id:3299,x:31015,y:33284,cmnt:向下部分遮罩,varname:node_3299,prsc:2|A-5008-OUT,B-9475-OUT;n:type:ShaderForge.SFN_Vector1,id:9475,x:30675,y:33215,varname:node_9475,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:174,x:30846,y:33215,varname:node_174,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:6639,x:31015,y:33127,varname:node_6639,prsc:2|A-174-OUT,B-523-OUT;n:type:ShaderForge.SFN_Subtract,id:1275,x:31190,y:33127,cmnt:侧面部分遮罩,varname:node_1275,prsc:2|A-6639-OUT,B-3299-OUT;n:type:ShaderForge.SFN_Color,id:5396,x:31010,y:32634,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_7783,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:6735,x:31363,y:32986,varname:node_6735,prsc:2|A-5396-RGB,B-523-OUT;n:type:ShaderForge.SFN_Multiply,id:1857,x:31363,y:33268,varname:node_1857,prsc:2|A-6871-RGB,B-3299-OUT;n:type:ShaderForge.SFN_Color,id:6871,x:31010,y:32971,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:_node_7783_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1683,x:31363,y:33127,varname:node_1683,prsc:2|A-4986-RGB,B-1275-OUT;n:type:ShaderForge.SFN_Color,id:4986,x:31010,y:32801,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_node_7783_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.490566,c2:0.490566,c3:0.490566,c4:1;n:type:ShaderForge.SFN_Add,id:8755,x:31533,y:33072,varname:node_8755,prsc:2|A-6735-OUT,B-1857-OUT;n:type:ShaderForge.SFN_Add,id:6285,x:31691,y:33179,cmnt:混合三重环境色,varname:node_6285,prsc:2|A-8755-OUT,B-1683-OUT;proporder:3604-5396-4986-6871;pass:END;sub:END;*/

Shader "AP01/L07/3ColAmbient_SF" {
    Properties {
        _Occlusion ("Occlusion", 2D) = "white" {}
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occlusion; uniform float4 _Occlusion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
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
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Occlusion_var = tex2D(_Occlusion,TRANSFORM_TEX(i.uv0, _Occlusion)); // 环境遮挡
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_1374 = i.normalDir.g;
                float node_9475 = 0.0;
                float node_523 = max(node_1374,node_9475); // 向上部分遮罩
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float node_3299 = max((node_1374*(-1.0)),node_9475); // 向下部分遮罩
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float3 emissive = (_Occlusion_var.rgb*(((_EnvUpCol_var.rgb*node_523)+(_EnvDownCol_var.rgb*node_3299))+(_EnvSideCol_var.rgb*((1.0-node_523)-node_3299))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

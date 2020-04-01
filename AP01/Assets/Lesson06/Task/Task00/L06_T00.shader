// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33498,y:32504,varname:node_3138,prsc:2|emission-5806-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:7585,x:32287,y:32463,varname:node_7585,prsc:2;n:type:ShaderForge.SFN_LightVector,id:7208,x:32287,y:32313,varname:node_7208,prsc:2;n:type:ShaderForge.SFN_Dot,id:22,x:32454,y:32383,cmnt:Phong,varname:node_22,prsc:2,dt:0|A-7208-OUT,B-7585-OUT;n:type:ShaderForge.SFN_RemapRange,id:457,x:32619,y:32383,cmnt:HalfPhong???,varname:node_457,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-22-OUT;n:type:ShaderForge.SFN_Tex2d,id:1165,x:32956,y:32383,ptovrint:False,ptlb:RampTex,ptin:_RampTex,cmnt:RampTex,varname:node_1165,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-67-OUT;n:type:ShaderForge.SFN_Append,id:67,x:32788,y:32383,varname:node_67,prsc:2|A-457-OUT,B-2237-OUT;n:type:ShaderForge.SFN_Slider,id:2237,x:32462,y:32576,ptovrint:False,ptlb:RampType,ptin:_RampType,varname:node_2237,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Max,id:6814,x:32956,y:32696,varname:node_6814,prsc:2|A-22-OUT,B-7912-OUT;n:type:ShaderForge.SFN_Vector1,id:7912,x:32788,y:32755,varname:node_7912,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:7572,x:33124,y:32696,cmnt:光源反射,varname:node_7572,prsc:2|VAL-6814-OUT,EXP-9902-OUT;n:type:ShaderForge.SFN_Add,id:5806,x:33299,y:32571,varname:node_5806,prsc:2|A-4690-OUT,B-7572-OUT;n:type:ShaderForge.SFN_Multiply,id:4690,x:33124,y:32463,cmnt:环境反射,varname:node_4690,prsc:2|A-1165-RGB,B-9652-OUT;n:type:ShaderForge.SFN_Slider,id:9652,x:32799,y:32577,ptovrint:False,ptlb:EnvRefInt,ptin:_EnvRefInt,varname:node_9652,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1570397,max:1;n:type:ShaderForge.SFN_Slider,id:9902,x:32799,y:32859,ptovrint:False,ptlb:SpecularPow,ptin:_SpecularPow,varname:node_9902,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:10,cur:30,max:90;proporder:1165-2237-9652-9902;pass:END;sub:END;*/

Shader "AP01/L06/T00" {
    Properties {
        _RampTex ("RampTex", 2D) = "white" {}
        _RampType ("RampType", Range(0, 1)) = 0
        _EnvRefInt ("EnvRefInt", Range(0, 1)) = 0.1570397
        _SpecularPow ("SpecularPow", Range(10, 90)) = 30
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
                UNITY_DEFINE_INSTANCED_PROP( float, _RampType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRefInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float node_22 = dot(lightDirection,viewReflectDirection); // Phong
                float _RampType_var = UNITY_ACCESS_INSTANCED_PROP( Props, _RampType );
                float2 node_67 = float2((node_22*0.5+0.5),_RampType_var);
                float4 _RampTex_var = tex2D(_RampTex,TRANSFORM_TEX(node_67, _RampTex)); // RampTex
                float _EnvRefInt_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvRefInt );
                float _SpecularPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPow );
                float3 emissive = ((_RampTex_var.rgb*_EnvRefInt_var)+pow(max(node_22,0.0),_SpecularPow_var));
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
                UNITY_DEFINE_INSTANCED_PROP( float, _RampType)
                UNITY_DEFINE_INSTANCED_PROP( float, _EnvRefInt)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPow)
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
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
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

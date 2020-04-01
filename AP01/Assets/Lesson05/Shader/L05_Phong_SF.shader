// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32940,y:32791,varname:node_3138,prsc:2|emission-3866-OUT;n:type:ShaderForge.SFN_Reflect,id:566,x:32197,y:32851,cmnt:rDir,varname:node_566,prsc:2|A-3310-OUT,B-1171-OUT;n:type:ShaderForge.SFN_NormalVector,id:1171,x:32034,y:32944,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:773,x:31872,y:32728,varname:node_773,prsc:2;n:type:ShaderForge.SFN_ViewVector,id:5528,x:32197,y:32998,varname:node_5528,prsc:2;n:type:ShaderForge.SFN_Dot,id:5290,x:32357,y:32915,cmnt:r dot v,varname:node_5290,prsc:2,dt:0|A-566-OUT,B-5528-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:3345,x:32198,y:32535,varname:node_3345,prsc:2;n:type:ShaderForge.SFN_LightVector,id:4445,x:32198,y:32680,varname:node_4445,prsc:2;n:type:ShaderForge.SFN_Dot,id:9367,x:32357,y:32599,cmnt: l dot vr 等价写法,varname:node_9367,prsc:2,dt:0|A-3345-OUT,B-4445-OUT;n:type:ShaderForge.SFN_Multiply,id:3310,x:32034,y:32789,varname:node_3310,prsc:2|A-773-OUT,B-4624-OUT;n:type:ShaderForge.SFN_Vector1,id:4624,x:31872,y:32871,varname:node_4624,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:9767,x:32522,y:32985,varname:node_9767,prsc:2|A-5290-OUT,B-5128-OUT;n:type:ShaderForge.SFN_Vector1,id:5128,x:32357,y:33093,varname:node_5128,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:3866,x:32700,y:32985,cmnt: Power 调整高光形态,varname:node_3866,prsc:2|VAL-9767-OUT,EXP-14-OUT;n:type:ShaderForge.SFN_Slider,id:14,x:32333,y:33199,ptovrint:False,ptlb:SpecularPower,ptin:_SpecularPower,varname:node_14,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:29.22609,max:90;proporder:14;pass:END;sub:END;*/

Shader "AP01/L05/Phong_SF" {
    Properties {
        _SpecularPower ("SpecularPower", Range(1, 90)) = 29.22609
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
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
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
                float node_5290 = dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection); // r dot v
                float _SpecularPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower );
                float node_3866 = pow(max(node_5290,0.0),_SpecularPower_var); //  Power 调整高光形态
                float3 emissive = float3(node_3866,node_3866,node_3866);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

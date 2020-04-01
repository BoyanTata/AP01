// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33099,y:32825,varname:node_3138,prsc:2|emission-1689-OUT;n:type:ShaderForge.SFN_Reflect,id:5687,x:32261,y:32915,cmnt:rDir,varname:node_5687,prsc:2|A-4227-OUT,B-6035-OUT;n:type:ShaderForge.SFN_NormalVector,id:6035,x:32098,y:33008,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:5991,x:31936,y:32792,varname:node_5991,prsc:2;n:type:ShaderForge.SFN_ViewVector,id:5354,x:32261,y:33062,varname:node_5354,prsc:2;n:type:ShaderForge.SFN_Dot,id:2600,x:32421,y:32979,cmnt:r dot v,varname:node_2600,prsc:2,dt:0|A-5687-OUT,B-5354-OUT;n:type:ShaderForge.SFN_Multiply,id:4227,x:32098,y:32853,varname:node_4227,prsc:2|A-5991-OUT,B-540-OUT;n:type:ShaderForge.SFN_Vector1,id:540,x:31936,y:32935,varname:node_540,prsc:2,v1:-1;n:type:ShaderForge.SFN_Max,id:8629,x:32586,y:33049,varname:node_8629,prsc:2|A-2600-OUT,B-4213-OUT;n:type:ShaderForge.SFN_Vector1,id:4213,x:32421,y:33157,varname:node_4213,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:4962,x:32751,y:33049,cmnt:Phong Specular,varname:node_4962,prsc:2|VAL-8629-OUT,EXP-195-OUT;n:type:ShaderForge.SFN_Slider,id:195,x:32397,y:33263,ptovrint:False,ptlb:SpecularPower,ptin:_SpecularPower,varname:node_14,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:29.22609,max:90;n:type:ShaderForge.SFN_Dot,id:2717,x:32418,y:32673,varname:node_2717,prsc:2,dt:0|A-6035-OUT,B-5991-OUT;n:type:ShaderForge.SFN_Max,id:8055,x:32583,y:32750,cmnt: Lambert Diffuse,varname:node_8055,prsc:2|A-2717-OUT,B-9165-OUT;n:type:ShaderForge.SFN_Vector1,id:9165,x:32418,y:32834,varname:node_9165,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:1689,x:32911,y:32926,varname:node_1689,prsc:2|A-9326-OUT,B-4962-OUT;n:type:ShaderForge.SFN_Color,id:8293,x:32583,y:32580,ptovrint:False,ptlb:BaseCol,ptin:_BaseCol,varname:node_8293,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9326,x:32755,y:32657,varname:node_9326,prsc:2|A-8293-RGB,B-8055-OUT;proporder:195-8293;pass:END;sub:END;*/

Shader "AP01/L06/OldSchoolP_SF" {
    Properties {
        _SpecularPower ("SpecularPower", Range(1, 90)) = 29.22609
        _BaseCol ("BaseCol", Color) = (0.5,0.5,0.5,1)
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
                UNITY_DEFINE_INSTANCED_PROP( float4, _BaseCol)
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
                float4 _BaseCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _BaseCol );
                float _SpecularPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower );
                float3 emissive = ((_BaseCol_var.rgb*max(dot(i.normalDir,lightDirection),0.0))+pow(max(dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection),0.0),_SpecularPower_var));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

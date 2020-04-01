// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3797,x:32375,y:32411,varname:node_3797,prsc:2|emission-8655-OUT;n:type:ShaderForge.SFN_LightVector,id:3723,x:30850,y:32648,varname:node_3723,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:6858,x:30850,y:32814,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:4603,x:31031,y:32648,varname:node_4603,prsc:2,dt:0|A-3723-OUT,B-6858-OUT;n:type:ShaderForge.SFN_Power,id:7185,x:31550,y:33012,varname:node_7185,prsc:2|VAL-2263-OUT,EXP-808-OUT;n:type:ShaderForge.SFN_Slider,id:7816,x:31196,y:33277,ptovrint:False,ptlb:SpecularPower1,ptin:_SpecularPower1,varname:node_9113,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:200;n:type:ShaderForge.SFN_Dot,id:2473,x:31196,y:33012,varname:node_2473,prsc:2,dt:0|A-2472-OUT,B-8942-OUT;n:type:ShaderForge.SFN_Tex2d,id:8232,x:31563,y:32722,ptovrint:False,ptlb:SSS_TEX,ptin:_SSS_TEX,varname:node_6807,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-8671-OUT;n:type:ShaderForge.SFN_Append,id:8671,x:31372,y:32722,varname:node_8671,prsc:2|A-5377-OUT,B-4901-OUT;n:type:ShaderForge.SFN_Slider,id:4901,x:31038,y:32843,ptovrint:False,ptlb:SSS_intensity,ptin:_SSS_intensity,varname:node_5546,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:7532,x:31195,y:32648,varname:node_7532,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-4603-OUT;n:type:ShaderForge.SFN_LightVector,id:8942,x:31015,y:33163,varname:node_8942,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:2472,x:31015,y:33012,varname:node_2472,prsc:2;n:type:ShaderForge.SFN_Max,id:2263,x:31360,y:33012,varname:node_2263,prsc:2|A-2473-OUT,B-2343-OUT;n:type:ShaderForge.SFN_Vector1,id:2343,x:31196,y:33181,varname:node_2343,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9794,x:31557,y:32442,ptovrint:False,ptlb:BaseColor,ptin:_BaseColor,varname:node_9794,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_RemapRange,id:9092,x:32547,y:33044,varname:node_9092,prsc:2,frmn:0,frmx:1,tomn:0,tomx:0.3|IN-7185-OUT;n:type:ShaderForge.SFN_RemapRange,id:296,x:32547,y:32855,varname:node_296,prsc:2,frmn:0.5,frmx:1,tomn:0.2,tomx:0.1|IN-7532-OUT;n:type:ShaderForge.SFN_Add,id:2222,x:32790,y:32855,varname:node_2222,prsc:2|B-296-OUT,C-9092-OUT;n:type:ShaderForge.SFN_Blend,id:9078,x:31788,y:32555,varname:node_9078,prsc:2,blmd:7,clmp:True|SRC-9794-R,DST-8232-RGB;n:type:ShaderForge.SFN_Add,id:8655,x:32121,y:32806,varname:node_8655,prsc:2|A-9078-OUT,B-2087-OUT;n:type:ShaderForge.SFN_Lerp,id:808,x:31595,y:33295,varname:node_808,prsc:2|A-7816-OUT,B-1495-OUT,T-9794-G;n:type:ShaderForge.SFN_Slider,id:1495,x:31196,y:33395,ptovrint:False,ptlb:SpecularPower2,ptin:_SpecularPower2,varname:_SpecularPower_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:200;n:type:ShaderForge.SFN_Multiply,id:7328,x:31775,y:33052,varname:node_7328,prsc:2|A-7185-OUT,B-9794-G;n:type:ShaderForge.SFN_Multiply,id:2087,x:32005,y:33052,varname:node_2087,prsc:2|A-7328-OUT,B-8435-OUT;n:type:ShaderForge.SFN_Vector1,id:8435,x:31888,y:33213,varname:node_8435,prsc:2,v1:5;n:type:ShaderForge.SFN_Multiply,id:5377,x:31270,y:32403,varname:node_5377,prsc:2|A-546-OUT,B-7532-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:546,x:31015,y:32294,varname:node_546,prsc:2;proporder:7816-8232-4901-9794-1495;pass:END;sub:END;*/

Shader "AP01/L06/T01" {
    Properties {
        _SpecularPower1 ("SpecularPower1", Range(0, 200)) = 2
        _SSS_TEX ("SSS_TEX", 2D) = "white" {}
        _SSS_intensity ("SSS_intensity", Range(0, 1)) = 1
        _BaseColor ("BaseColor", 2D) = "white" {}
        _SpecularPower2 ("SpecularPower2", Range(0, 200)) = 0
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
            #pragma multi_compile_fog
            #pragma target 3.0
            uniform sampler2D _SSS_TEX; uniform float4 _SSS_TEX_ST;
            uniform sampler2D _BaseColor; uniform float4 _BaseColor_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SSS_intensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower2)
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                float4 _BaseColor_var = tex2D(_BaseColor,TRANSFORM_TEX(i.uv0, _BaseColor));
                float node_7532 = (dot(lightDirection,i.normalDir)*0.5+0.5);
                float _SSS_intensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SSS_intensity );
                float2 node_8671 = float2((attenuation*node_7532),_SSS_intensity_var);
                float4 _SSS_TEX_var = tex2D(_SSS_TEX,TRANSFORM_TEX(node_8671, _SSS_TEX));
                float _SpecularPower1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower1 );
                float _SpecularPower2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower2 );
                float node_7185 = pow(max(dot(viewReflectDirection,lightDirection),0.0),lerp(_SpecularPower1_var,_SpecularPower2_var,_BaseColor_var.g));
                float3 emissive = (saturate((_SSS_TEX_var.rgb/(1.0-_BaseColor_var.r)))+((node_7185*_BaseColor_var.g)*5.0));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

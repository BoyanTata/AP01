// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32577,y:32255,varname:node_3138,prsc:2|emission-6980-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31977,y:32446,ptovrint:False,ptlb:FresnelCol,ptin:_FresnelCol,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7505785,c2:0.9463587,c3:0.9528302,c4:1;n:type:ShaderForge.SFN_ViewReflectionVector,id:3688,x:31098,y:32250,varname:node_3688,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6053,x:31098,y:32391,varname:node_6053,prsc:2;n:type:ShaderForge.SFN_Dot,id:9473,x:31262,y:32250,varname:node_9473,prsc:2,dt:0|A-3688-OUT,B-6053-OUT;n:type:ShaderForge.SFN_Power,id:938,x:31622,y:32250,cmnt:Phong,varname:node_938,prsc:2|VAL-9700-OUT,EXP-2202-OUT;n:type:ShaderForge.SFN_Slider,id:2202,x:31267,y:32430,ptovrint:False,ptlb:SpecPow,ptin:_SpecPow,varname:node_2202,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:1,max:90;n:type:ShaderForge.SFN_Fresnel,id:9427,x:31438,y:31905,varname:node_9427,prsc:2|EXP-4734-OUT;n:type:ShaderForge.SFN_Slider,id:4734,x:31107,y:31932,ptovrint:False,ptlb:FresnelPow,ptin:_FresnelPow,varname:node_4734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:20;n:type:ShaderForge.SFN_Tex2d,id:7292,x:31977,y:32250,ptovrint:False,ptlb:SpecRamp,ptin:_SpecRamp,varname:node_7292,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5119-OUT;n:type:ShaderForge.SFN_Append,id:5119,x:31801,y:32250,varname:node_5119,prsc:2|A-938-OUT,B-173-OUT;n:type:ShaderForge.SFN_Vector1,id:173,x:31618,y:32407,varname:node_173,prsc:2,v1:0.2;n:type:ShaderForge.SFN_NormalVector,id:4232,x:31098,y:32547,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:6752,x:31438,y:32046,varname:node_6752,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-4232-OUT;n:type:ShaderForge.SFN_Multiply,id:3886,x:31621,y:31989,varname:node_3886,prsc:2|A-9427-OUT,B-6752-OUT;n:type:ShaderForge.SFN_Lerp,id:1129,x:32186,y:32160,varname:node_1129,prsc:2|A-7292-RGB,B-7241-RGB,T-3886-OUT;n:type:ShaderForge.SFN_Dot,id:5852,x:31267,y:32547,varname:node_5852,prsc:2,dt:0|A-6053-OUT,B-4232-OUT;n:type:ShaderForge.SFN_Max,id:3943,x:31435,y:32547,cmnt:Lambert,varname:node_3943,prsc:2|A-4817-OUT,B-5852-OUT;n:type:ShaderForge.SFN_Vector1,id:4817,x:31267,y:32710,varname:node_4817,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:1459,x:31435,y:32710,ptovrint:False,ptlb:MainCol,ptin:_MainCol,varname:node_1459,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1792453,c2:0.1581079,c3:0.1593877,c4:1;n:type:ShaderForge.SFN_Multiply,id:4146,x:31618,y:32547,varname:node_4146,prsc:2|A-3943-OUT,B-1459-RGB;n:type:ShaderForge.SFN_Add,id:6980,x:32398,y:32354,varname:node_6980,prsc:2|A-1129-OUT,B-4146-OUT;n:type:ShaderForge.SFN_Max,id:9700,x:31438,y:32250,varname:node_9700,prsc:2|A-4817-OUT,B-9473-OUT;proporder:7241-4734-7292-2202-1459;pass:END;sub:END;*/

Shader "AP01/L08/Task01" {
    Properties {
        _FresnelCol ("FresnelCol", Color) = (0.7505785,0.9463587,0.9528302,1)
        _FresnelPow ("FresnelPow", Range(0, 20)) = 5
        _SpecRamp ("SpecRamp", 2D) = "white" {}
        _SpecPow ("SpecPow", Range(1, 90)) = 1
        _MainCol ("MainCol", Color) = (0.1792453,0.1581079,0.1593877,1)
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
            uniform sampler2D _SpecRamp; uniform float4 _SpecRamp_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
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
                float node_4817 = 0.0;
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float2 node_5119 = float2(pow(max(node_4817,dot(viewReflectDirection,lightDirection)),_SpecPow_var),0.2);
                float4 _SpecRamp_var = tex2D(_SpecRamp,TRANSFORM_TEX(node_5119, _SpecRamp));
                float4 _FresnelCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelCol );
                float _FresnelPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnelPow );
                float4 _MainCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainCol );
                float3 emissive = (lerp(_SpecRamp_var.rgb,_FresnelCol_var.rgb,(pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelPow_var)*i.normalDir.g))+(max(node_4817,dot(lightDirection,i.normalDir))*_MainCol_var.rgb));
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
            uniform sampler2D _SpecRamp; uniform float4 _SpecRamp_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _FresnelCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnelPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainCol)
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

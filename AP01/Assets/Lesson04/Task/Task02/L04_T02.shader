// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33623,y:33844,varname:node_3138,prsc:2|emission-4402-OUT;n:type:ShaderForge.SFN_Tex2d,id:1082,x:32423,y:33443,varname:node_1082,prsc:2,ntxv:0,isnm:False|UVIN-3568-OUT,TEX-3827-TEX;n:type:ShaderForge.SFN_Tex2d,id:4389,x:32423,y:33586,varname:node_4389,prsc:2,ntxv:0,isnm:False|UVIN-3617-OUT,TEX-3827-TEX;n:type:ShaderForge.SFN_TexCoord,id:4690,x:32055,y:33488,varname:node_4690,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:3568,x:32249,y:33393,varname:node_3568,prsc:2|A-2354-OUT,B-4690-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:2354,x:32055,y:33415,ptovrint:False,ptlb:NoiseTiling1 噪点缩放1,ptin:_NoiseTiling11,varname:node_2354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Multiply,id:3617,x:32249,y:33525,varname:node_3617,prsc:2|A-5997-OUT,B-4690-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:5997,x:32055,y:33680,ptovrint:False,ptlb:NoiseTiling2 噪点缩放2,ptin:_NoiseTiling22,varname:node_5997,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2dAsset,id:3827,x:32249,y:33680,ptovrint:False,ptlb:NosieTex 噪点图,ptin:_NosieTex,varname:node_3827,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:995,x:32614,y:33522,cmnt:两层分型纹理,varname:node_995,prsc:2|A-1082-R,B-4389-R;n:type:ShaderForge.SFN_Slider,id:7239,x:32457,y:33814,ptovrint:False,ptlb:NoisePower 噪点强度,ptin:_NoisePower,varname:node_7239,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_NormalVector,id:4592,x:32248,y:33864,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:4483,x:32248,y:34046,varname:node_4483,prsc:2;n:type:ShaderForge.SFN_Dot,id:3532,x:32429,y:33951,varname:node_3532,prsc:2,dt:0|A-4592-OUT,B-4483-OUT;n:type:ShaderForge.SFN_Clamp01,id:3221,x:32605,y:33951,varname:node_3221,prsc:2|IN-3532-OUT;n:type:ShaderForge.SFN_Round,id:1998,x:33140,y:33774,cmnt:高光,varname:node_1998,prsc:2|IN-8021-OUT;n:type:ShaderForge.SFN_Color,id:5413,x:33139,y:34238,ptovrint:False,ptlb:LightCol 亮部颜色,ptin:_LightCol,varname:node_5413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:9437,x:32448,y:34144,ptovrint:False,ptlb:SpecPow 高光次幂,ptin:_SpecPow,varname:node_9437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:30,max:90;n:type:ShaderForge.SFN_Power,id:1834,x:32778,y:33951,varname:node_1834,prsc:2|VAL-3221-OUT,EXP-9437-OUT;n:type:ShaderForge.SFN_Blend,id:8021,x:32967,y:33774,varname:node_8021,prsc:2,blmd:10,clmp:True|SRC-1834-OUT,DST-2588-OUT;n:type:ShaderForge.SFN_Vector3,id:1925,x:32614,y:33674,varname:node_1925,prsc:2,v1:0.5,v2:0.5,v3:0.5;n:type:ShaderForge.SFN_Lerp,id:2588,x:32787,y:33588,varname:node_2588,prsc:2|A-1925-OUT,B-995-OUT,T-7239-OUT;n:type:ShaderForge.SFN_LightVector,id:7447,x:32246,y:34336,varname:node_7447,prsc:2;n:type:ShaderForge.SFN_Dot,id:106,x:32429,y:34262,varname:node_106,prsc:2,dt:0|A-4592-OUT,B-7447-OUT;n:type:ShaderForge.SFN_Clamp01,id:8159,x:32605,y:34262,varname:node_8159,prsc:2|IN-106-OUT;n:type:ShaderForge.SFN_Round,id:2749,x:33139,y:34083,cmnt:明暗,varname:node_2749,prsc:2|IN-6828-OUT;n:type:ShaderForge.SFN_Blend,id:6828,x:32966,y:34083,varname:node_6828,prsc:2,blmd:10,clmp:True|SRC-2588-OUT,DST-8159-OUT;n:type:ShaderForge.SFN_Color,id:2486,x:33139,y:34426,ptovrint:False,ptlb:DarkCol 暗部颜色,ptin:_DarkCol,varname:_LightCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Lerp,id:2910,x:33305,y:34302,varname:node_2910,prsc:2|A-2486-RGB,B-5413-RGB,T-2749-OUT;n:type:ShaderForge.SFN_Lerp,id:4402,x:33431,y:33944,varname:node_4402,prsc:2|A-2910-OUT,B-23-RGB,T-1998-OUT;n:type:ShaderForge.SFN_Color,id:23,x:33139,y:33916,ptovrint:False,ptlb:SpecCol 高光颜色,ptin:_SpecCol,varname:node_23,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;proporder:5413-2486-23-9437-3827-2354-5997-7239;pass:END;sub:END;*/

Shader "AP01/L04/T02" {
    Properties {
        _LightCol ("LightCol 亮部颜色", Color) = (0.5,0.5,0.5,1)
        _DarkCol ("DarkCol 暗部颜色", Color) = (0,0,0,1)
        _SpecCol ("SpecCol 高光颜色", Color) = (0.5,0.5,0.5,1)
        _SpecPow ("SpecPow 高光次幂", Range(1, 90)) = 30
        _NosieTex ("NosieTex 噪点图", 2D) = "white" {}
        _NoiseTiling11 ("NoiseTiling1 噪点缩放1", Float ) = 3
        _NoiseTiling22 ("NoiseTiling2 噪点缩放2", Float ) = 1
        _NoisePower ("NoisePower 噪点强度", Range(-1, 1)) = 0
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
            uniform sampler2D _NosieTex; uniform float4 _NosieTex_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _NoiseTiling11)
                UNITY_DEFINE_INSTANCED_PROP( float, _NoiseTiling22)
                UNITY_DEFINE_INSTANCED_PROP( float, _NoisePower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightCol)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _DarkCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecCol)
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
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
////// Emissive:
                float4 _DarkCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DarkCol );
                float4 _LightCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightCol );
                float _NoiseTiling11_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NoiseTiling11 );
                float2 node_3568 = (_NoiseTiling11_var*i.uv0);
                float4 node_1082 = tex2D(_NosieTex,TRANSFORM_TEX(node_3568, _NosieTex));
                float _NoiseTiling22_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NoiseTiling22 );
                float2 node_3617 = (_NoiseTiling22_var*i.uv0);
                float4 node_4389 = tex2D(_NosieTex,TRANSFORM_TEX(node_3617, _NosieTex));
                float node_995 = (node_1082.r*node_4389.r); // 两层分型纹理
                float _NoisePower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NoisePower );
                float3 node_2588 = lerp(float3(0.5,0.5,0.5),float3(node_995,node_995,node_995),_NoisePower_var);
                float4 _SpecCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecCol );
                float _SpecPow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow );
                float3 emissive = lerp(lerp(_DarkCol_var.rgb,_LightCol_var.rgb,round(saturate(( saturate(dot(normalDirection,lightDirection)) > 0.5 ? (1.0-(1.0-2.0*(saturate(dot(normalDirection,lightDirection))-0.5))*(1.0-node_2588)) : (2.0*saturate(dot(normalDirection,lightDirection))*node_2588) )))),_SpecCol_var.rgb,round(saturate(( node_2588 > 0.5 ? (1.0-(1.0-2.0*(node_2588-0.5))*(1.0-pow(saturate(dot(normalDirection,halfDirection)),_SpecPow_var))) : (2.0*node_2588*pow(saturate(dot(normalDirection,halfDirection)),_SpecPow_var)) ))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

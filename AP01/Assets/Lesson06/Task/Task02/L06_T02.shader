// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:False,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33803,y:32076,varname:node_3138,prsc:2|emission-1882-OUT;n:type:ShaderForge.SFN_NormalVector,id:2601,x:32082,y:32858,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:6660,x:32082,y:32997,varname:node_6660,prsc:2;n:type:ShaderForge.SFN_Dot,id:6432,x:32266,y:32858,varname:node_6432,prsc:2,dt:0|A-2601-OUT,B-6660-OUT;n:type:ShaderForge.SFN_Vector1,id:9105,x:32266,y:32997,varname:node_9105,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:6833,x:32487,y:32858,varname:node_6833,prsc:2|A-6432-OUT,B-9105-OUT;n:type:ShaderForge.SFN_Dot,id:4029,x:32102,y:32064,varname:node_4029,prsc:2,dt:0|A-8648-OUT,B-5821-OUT;n:type:ShaderForge.SFN_NormalVector,id:8751,x:31698,y:32198,prsc:2,pt:False;n:type:ShaderForge.SFN_Max,id:4932,x:32305,y:32064,varname:node_4932,prsc:2|A-4029-OUT,B-9012-OUT;n:type:ShaderForge.SFN_Vector1,id:9012,x:32102,y:32208,varname:node_9012,prsc:2,v1:0;n:type:ShaderForge.SFN_Color,id:5503,x:32487,y:33039,ptovrint:False,ptlb:Color(Smooth),ptin:_ColorSmooth,varname:node_5503,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1481844,c2:0.8490566,c3:0.4323132,c4:1;n:type:ShaderForge.SFN_Multiply,id:8708,x:33001,y:32877,varname:node_8708,prsc:2|A-6833-OUT,B-3317-OUT;n:type:ShaderForge.SFN_Add,id:1882,x:33464,y:32805,varname:node_1882,prsc:2|A-3878-OUT,B-8708-OUT;n:type:ShaderForge.SFN_Power,id:9922,x:32523,y:32064,varname:node_9922,prsc:2|VAL-4932-OUT,EXP-2906-OUT;n:type:ShaderForge.SFN_ViewVector,id:5821,x:31893,y:32208,varname:node_5821,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6183,x:31507,y:32064,varname:node_6183,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6158,x:31698,y:32064,varname:node_6158,prsc:2|A-9538-OUT,B-6183-OUT;n:type:ShaderForge.SFN_Vector1,id:9538,x:31507,y:31998,varname:node_9538,prsc:2,v1:-1;n:type:ShaderForge.SFN_Reflect,id:8648,x:31893,y:32064,varname:node_8648,prsc:2|A-6158-OUT,B-8751-OUT;n:type:ShaderForge.SFN_Tex2d,id:1918,x:32487,y:33425,ptovrint:False,ptlb:Mask Map,ptin:_MaskMap,varname:node_1918,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-2650-UVOUT;n:type:ShaderForge.SFN_Slider,id:1432,x:32385,y:33645,ptovrint:False,ptlb:Mask Range,ptin:_MaskRange,varname:node_1432,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4075758,max:1;n:type:ShaderForge.SFN_Step,id:7390,x:32720,y:33425,varname:node_7390,prsc:2|A-1918-RGB,B-1432-OUT;n:type:ShaderForge.SFN_TexCoord,id:5518,x:32036,y:33425,varname:node_5518,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_UVTile,id:2650,x:32269,y:33425,varname:node_2650,prsc:2|UVIN-5518-UVOUT,WDT-6116-OUT,HGT-6116-OUT,TILE-2538-OUT;n:type:ShaderForge.SFN_Slider,id:6116,x:32036,y:33641,ptovrint:False,ptlb:Mask Tile,ptin:_MaskTile,varname:node_6116,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3249554,max:1;n:type:ShaderForge.SFN_Vector1,id:2538,x:32036,y:33565,varname:node_2538,prsc:2,v1:1;n:type:ShaderForge.SFN_Lerp,id:7538,x:33782,y:33100,varname:node_7538,prsc:2|A-1882-OUT,B-1433-OUT,T-7860-OUT;n:type:ShaderForge.SFN_Multiply,id:1433,x:32832,y:33168,varname:node_1433,prsc:2|A-6833-OUT,B-3331-RGB;n:type:ShaderForge.SFN_Color,id:3331,x:32487,y:33201,ptovrint:False,ptlb:Color(Rough),ptin:_ColorRough,varname:_node_5503_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4811321,c2:0.1591067,c3:0.06127626,c4:1;n:type:ShaderForge.SFN_Desaturate,id:7860,x:32933,y:33428,varname:node_7860,prsc:2|COL-7390-OUT;n:type:ShaderForge.SFN_Fresnel,id:5261,x:32433,y:32477,varname:node_5261,prsc:2;n:type:ShaderForge.SFN_Power,id:7499,x:32832,y:32531,varname:node_7499,prsc:2|VAL-5261-OUT,EXP-8868-OUT;n:type:ShaderForge.SFN_Slider,id:8212,x:32069,y:32601,ptovrint:False,ptlb:Fresnal Range,ptin:_FresnalRange,varname:node_8212,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;n:type:ShaderForge.SFN_Exp,id:8868,x:32433,y:32605,varname:node_8868,prsc:2,et:0|IN-8212-OUT;n:type:ShaderForge.SFN_Add,id:3878,x:33272,y:32400,varname:node_3878,prsc:2|A-9922-OUT,B-8145-OUT;n:type:ShaderForge.SFN_Multiply,id:8145,x:33043,y:32521,varname:node_8145,prsc:2|A-7499-OUT,B-3299-OUT;n:type:ShaderForge.SFN_Vector1,id:4519,x:32620,y:32671,varname:node_4519,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:3299,x:32832,y:32698,varname:node_3299,prsc:2|A-4519-OUT,B-5503-RGB;n:type:ShaderForge.SFN_Slider,id:1230,x:32854,y:33618,ptovrint:False,ptlb:SpecPow1,ptin:_SpecPow1,varname:node_1230,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:100;n:type:ShaderForge.SFN_Multiply,id:1972,x:31903,y:33180,varname:node_1972,prsc:2;n:type:ShaderForge.SFN_Slider,id:7259,x:32854,y:33736,ptovrint:False,ptlb:SpecPow2,ptin:_SpecPow2,varname:_SpecPow2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:100;n:type:ShaderForge.SFN_Lerp,id:2906,x:33222,y:33511,varname:node_2906,prsc:2|A-1230-OUT,B-7259-OUT,T-7860-OUT;n:type:ShaderForge.SFN_Lerp,id:3317,x:33061,y:33244,varname:node_3317,prsc:2|A-5503-RGB,B-3331-RGB,T-7860-OUT;proporder:5503-3331-1918-1432-6116-8212-1230-7259;pass:END;sub:END;*/

Shader "AP01/L06/T02" {
    Properties {
        _ColorSmooth ("Color(Smooth)", Color) = (0.1481844,0.8490566,0.4323132,1)
        _ColorRough ("Color(Rough)", Color) = (0.4811321,0.1591067,0.06127626,1)
        _MaskMap ("Mask Map", 2D) = "white" {}
        _MaskRange ("Mask Range", Range(0, 1)) = 0.4075758
        _MaskTile ("Mask Tile", Range(0, 1)) = 0.3249554
        _FresnalRange ("Fresnal Range", Range(0, 10)) = 10
        _SpecPow1 ("SpecPow1", Range(0, 100)) = 10
        _SpecPow2 ("SpecPow2", Range(0, 100)) = 10
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _MaskMap; uniform float4 _MaskMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorSmooth)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskTile)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorRough)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnalRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow2)
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
////// Emissive:
                float _SpecPow1_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow1 );
                float _SpecPow2_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecPow2 );
                float _MaskTile_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskTile );
                float node_2538 = 1.0;
                float2 node_2650_tc_rcp = float2(1.0,1.0)/float2( _MaskTile_var, _MaskTile_var );
                float node_2650_ty = floor(node_2538 * node_2650_tc_rcp.x);
                float node_2650_tx = node_2538 - _MaskTile_var * node_2650_ty;
                float2 node_2650 = (i.uv0 + float2(node_2650_tx, node_2650_ty)) * node_2650_tc_rcp;
                float4 _MaskMap_var = tex2D(_MaskMap,TRANSFORM_TEX(node_2650, _MaskMap));
                float _MaskRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MaskRange );
                float node_7860 = dot(step(_MaskMap_var.rgb,_MaskRange_var),float3(0.3,0.59,0.11));
                float _FresnalRange_var = UNITY_ACCESS_INSTANCED_PROP( Props, _FresnalRange );
                float4 _ColorSmooth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorSmooth );
                float node_6833 = max(dot(i.normalDir,lightDirection),0.0);
                float4 _ColorRough_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ColorRough );
                float3 node_1882 = ((pow(max(dot(reflect(((-1.0)*lightDirection),i.normalDir),viewDirection),0.0),lerp(_SpecPow1_var,_SpecPow2_var,node_7860))+(pow((1.0-max(0,dot(normalDirection, viewDirection))),exp(_FresnalRange_var))*(0.5*_ColorSmooth_var.rgb)))+(node_6833*lerp(_ColorSmooth_var.rgb,_ColorRough_var.rgb,node_7860)));
                float3 emissive = node_1882;
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
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform sampler2D _MaskMap; uniform float4 _MaskMap_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorSmooth)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _MaskTile)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ColorRough)
                UNITY_DEFINE_INSTANCED_PROP( float, _FresnalRange)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow1)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecPow2)
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

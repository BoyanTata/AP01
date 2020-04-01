// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33410,y:32336,varname:node_3138,prsc:2|emission-5756-OUT,olwid-2043-OUT,olcol-8329-RGB;n:type:ShaderForge.SFN_Slider,id:2043,x:32947,y:32740,ptovrint:False,ptlb:outline width,ptin:_outlinewidth,varname:node_2043,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.01,max:0.05;n:type:ShaderForge.SFN_Color,id:8329,x:33104,y:32852,ptovrint:False,ptlb:outline color,ptin:_outlinecolor,varname:node_8329,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3773585,c2:0.1833393,c3:0.1833393,c4:1;n:type:ShaderForge.SFN_NormalVector,id:1743,x:32498,y:32342,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:2369,x:32680,y:32426,cmnt:明暗,varname:node_2369,prsc:2,dt:0|A-1743-OUT,B-6664-OUT;n:type:ShaderForge.SFN_LightVector,id:6664,x:32498,y:32510,varname:node_6664,prsc:2;n:type:ShaderForge.SFN_Step,id:8769,x:32882,y:32295,cmnt:阴影线,varname:node_8769,prsc:2|A-7785-R,B-2369-OUT;n:type:ShaderForge.SFN_Tex2d,id:7785,x:32686,y:32159,ptovrint:False,ptlb:patterrn,ptin:_patterrn,cmnt:排线 输出单通道即可,varname:node_7785,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-5606-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9529,x:32302,y:32046,varname:node_9529,prsc:2,sctp:1;n:type:ShaderForge.SFN_Color,id:4124,x:32916,y:31895,ptovrint:False,ptlb:dark,ptin:_dark,varname:node_4124,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:3381,x:32916,y:32089,ptovrint:False,ptlb:light,ptin:_light,varname:node_3381,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Lerp,id:4721,x:33107,y:31997,varname:node_4721,prsc:2|A-4124-RGB,B-3381-RGB,T-8769-OUT;n:type:ShaderForge.SFN_Depth,id:1232,x:32302,y:32223,varname:node_1232,prsc:2;n:type:ShaderForge.SFN_Multiply,id:5606,x:32498,y:32159,varname:node_5606,prsc:2|A-9529-UVOUT,B-1232-OUT;n:type:ShaderForge.SFN_Color,id:1721,x:32680,y:32615,ptovrint:False,ptlb:multiply color,ptin:_multiplycolor,varname:node_1721,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5847,x:32882,y:32516,varname:node_5847,prsc:2|A-2369-OUT,B-1721-RGB;n:type:ShaderForge.SFN_Add,id:5756,x:33176,y:32436,varname:node_5756,prsc:2|A-4721-OUT,B-5847-OUT;n:type:ShaderForge.SFN_Code,id:5023,x:31706,y:32387,varname:node_5023,prsc:2,code:cgBlAHQAdQByAG4AIABVAG4AaQB0AHkATwBiAGoAZQBjAHQAVABvAEMAbABpAHAAUABvAHMAKABmAGwAbwBhAHQANAAoADAALAAwACwAMAAsADAAKQApAC4AdwA7AA==,output:0,fname:Function_node_5023,width:695,height:132;proporder:2043-8329-7785-4124-3381-1721;pass:END;sub:END;*/

Shader "AP01/L02/T02" {
    Properties {
        _outlinewidth ("outline width", Range(0, 0.05)) = 0.01
        _outlinecolor ("outline color", Color) = (0.3773585,0.1833393,0.1833393,1)
        _patterrn ("patterrn", 2D) = "white" {}
        _dark ("dark", Color) = (0.5,0.5,0.5,1)
        _light ("light", Color) = (0.5,0.5,0.5,1)
        _multiplycolor ("multiply color", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _outlinewidth)
                UNITY_DEFINE_INSTANCED_PROP( float4, _outlinecolor)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _outlinewidth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _outlinewidth );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_outlinewidth_var,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _outlinecolor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _outlinecolor );
                return fixed4(_outlinecolor_var.rgb,0);
            }
            ENDCG
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
            uniform sampler2D _patterrn; uniform float4 _patterrn_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _dark)
                UNITY_DEFINE_INSTANCED_PROP( float4, _light)
                UNITY_DEFINE_INSTANCED_PROP( float4, _multiplycolor)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _dark_var = UNITY_ACCESS_INSTANCED_PROP( Props, _dark );
                float4 _light_var = UNITY_ACCESS_INSTANCED_PROP( Props, _light );
                float2 node_5606 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*partZ);
                float4 _patterrn_var = tex2D(_patterrn,TRANSFORM_TEX(node_5606, _patterrn)); // 排线 输出单通道即可
                float node_2369 = dot(i.normalDir,lightDirection); // 明暗
                float4 _multiplycolor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _multiplycolor );
                float3 emissive = (lerp(_dark_var.rgb,_light_var.rgb,step(_patterrn_var.r,node_2369))+(node_2369*_multiplycolor_var.rgb));
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
            uniform sampler2D _patterrn; uniform float4 _patterrn_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _dark)
                UNITY_DEFINE_INSTANCED_PROP( float4, _light)
                UNITY_DEFINE_INSTANCED_PROP( float4, _multiplycolor)
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
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
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

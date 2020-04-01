// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32597,y:33096,varname:node_3138,prsc:2|emission-9398-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:31462,y:33191,ptovrint:False,ptlb:OneColor：伪造光颜色,ptin:_OneColor,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6933962,c2:0.9671069,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:6898,x:31462,y:33383,ptovrint:False,ptlb:OneSlider：伪造光强度,ptin:_OneSlider,varname:node_6898,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.295701,max:2;n:type:ShaderForge.SFN_SwitchProperty,id:9398,x:32319,y:33429,ptovrint:False,ptlb:OneSwitch：光照开关,ptin:_OneSwitch,cmnt:光照效果开关,varname:node_9398,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-2187-RGB,B-1502-OUT;n:type:ShaderForge.SFN_Tex2d,id:2187,x:31858,y:33513,ptovrint:False,ptlb:OneTexture：美术自定义贴图,ptin:_OneTexture,cmnt:贴图采样 纯贴图效果,varname:node_2187,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:97e13bc521d7b4dada406599941bef7a,ntxv:0,isnm:False|UVIN-3564-UVOUT;n:type:ShaderForge.SFN_Vector4Property,id:2071,x:31470,y:32765,ptovrint:False,ptlb:OneVector：伪造光方向,ptin:_OneVector,varname:node_2071,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5,v2:0.5,v3:0.5,v4:1;n:type:ShaderForge.SFN_Normalize,id:9634,x:31648,y:32765,cmnt:伪造的LightDir,varname:node_9634,prsc:2|IN-2071-XYZ;n:type:ShaderForge.SFN_NormalVector,id:3371,x:31648,y:32931,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:5436,x:31821,y:32855,varname:node_5436,prsc:2,dt:0|A-9634-OUT,B-3371-OUT;n:type:ShaderForge.SFN_RemapRange,id:4992,x:31995,y:32855,cmnt:HalfLambert,varname:node_4992,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-5436-OUT;n:type:ShaderForge.SFN_Multiply,id:1069,x:31672,y:33191,cmnt:乘以光颜色,varname:node_1069,prsc:2|A-4992-OUT,B-7241-RGB;n:type:ShaderForge.SFN_Multiply,id:3158,x:31867,y:33191,cmnt:乘以光强度,varname:node_3158,prsc:2|A-1069-OUT,B-6898-OUT;n:type:ShaderForge.SFN_TexCoord,id:3564,x:31633,y:33558,varname:node_3564,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:1502,x:32088,y:33335,cmnt:贴图混合光照效果,varname:node_1502,prsc:2|A-3158-OUT,B-2187-RGB;proporder:2187-2071-7241-6898-9398;pass:END;sub:END;*/

Shader "AP01/L03/FakeLight_SF" {
    Properties {
        _OneTexture ("OneTexture：美术自定义贴图", 2D) = "white" {}
        _OneVector ("OneVector：伪造光方向", Vector) = (0.5,0.5,0.5,1)
        _OneColor ("OneColor：伪造光颜色", Color) = (0.6933962,0.9671069,1,1)
        _OneSlider ("OneSlider：伪造光强度", Range(0, 2)) = 1.295701
        [MaterialToggle] _OneSwitch ("OneSwitch：光照开关", Float ) = 0
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
            uniform sampler2D _OneTexture; uniform float4 _OneTexture_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _OneColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _OneSlider)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _OneSwitch)
                UNITY_DEFINE_INSTANCED_PROP( float4, _OneVector)
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
                float4 _OneTexture_var = tex2D(_OneTexture,TRANSFORM_TEX(i.uv0, _OneTexture)); // 贴图采样 纯贴图效果
                float4 _OneVector_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OneVector );
                float4 _OneColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OneColor );
                float _OneSlider_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OneSlider );
                float3 _OneSwitch_var = lerp( _OneTexture_var.rgb, ((((dot(normalize(_OneVector_var.rgb),i.normalDir)*0.5+0.5)*_OneColor_var.rgb)*_OneSlider_var)*_OneTexture_var.rgb), UNITY_ACCESS_INSTANCED_PROP( Props, _OneSwitch ) ); // 光照效果开关
                float3 emissive = _OneSwitch_var;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

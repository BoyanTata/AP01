Shader "AP01/L07/3ColAmbient" {
    Properties {
        _Occlusion  ("环境遮挡图", 2d)      = "white" {}
        _EnvUpCol   ("朝上环境色", color)   = (1.0, 1.0, 1.0, 1.0)
        _EnvSideCol ("侧面环境色", color)   = (0.5, 0.5, 0.5, 1.0)
        _EnvDownCol ("朝下环境色", color)   = (0.0, 0.0, 0.0, 1.0)
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
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            // 输入参数
            uniform float3 _EnvUpCol;
            uniform float3 _EnvSideCol;
            uniform float3 _EnvDownCol;
            uniform sampler2D _Occlusion;
            // 输入结构
            struct VertexInput {
                float4 vertex : POSITION;   // 将模型顶点信息输入进来
                float4 normal : NORMAL;     // 将模型法线信息输入进来
                float2 uv0 : TEXCOORD0;     // 将模型UV信息输入进来 0通道 共4通道
            };
            // 输出结构
            struct VertexOutput {
                float4 pos : SV_POSITION;   // 由模型顶点信息换算而来的顶点屏幕位置
                float3 nDirWS : TEXCOORD0;  // 由模型法线信息换算来的世界空间法线信息
                float2 uv : TEXCOORD1;      // 追加UV信息用语像素Shader采样贴图
            };
            // 输入结构>>>顶点Shader>>>输出结构
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;               // 新建一个输出结构
                o.pos = UnityObjectToClipPos( v.vertex );       // 变换顶点信息 并将其塞给输出结构
                o.nDirWS = UnityObjectToWorldNormal(v.normal);  // 变换法线信息 并将其塞给输出结构
                o.uv = v.uv0;                                   // 图森破
                return o;                                       // 将输出结构 输出
            }
            // 输出结构>>>像素
            float4 frag(VertexOutput i) : COLOR {
                // 准备向量
                float3 nDir = i.nDirWS;                         // 获取nDir
                // 计算各部位遮罩
                float upMask = max(0.0, nDir.g);                // 获取朝上部分遮罩
                float downMask = max(0.0, -nDir.g);             // 获取朝下部分遮罩
                float sideMask = 1.0 - upMask - downMask;       // 获取侧面部分遮罩
                // 混合环境色
                float3 envCol = _EnvUpCol * upMask + _EnvSideCol * sideMask + _EnvDownCol * downMask;
                // 采样Occlusion贴图
                float occlusion = tex2D(_Occlusion, i.uv);
                // 计算环境光照
                float3 envLighting = envCol * occlusion;
                // 返回最终颜色
                return float4(envLighting, 1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
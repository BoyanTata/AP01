#ifndef MY_CGINC
#define MY_CGINC

// 三颜色（顶，侧，底）插值环境光方法
float3 TriColAmbient (float3 n, float3 uCol, float3 sCol, float dCol) {
    float uMask = max(0.0, n.g);        // 获取朝上部分遮罩
    float dMask = max(0.0, -n.g);       // 获取朝下部分遮罩
    float sMask = 1.0 - uMask - dMask;  // 获取侧面部分遮罩
    float3 envCol = uCol * uMask +
                    sCol * sMask +
                    dCol * dMask;       // 混合环境色
    return envCol;
}

#endif
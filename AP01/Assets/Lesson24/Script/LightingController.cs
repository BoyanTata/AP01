using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

[ExecuteInEditMode] // 使脚本在Editor下也能触发OnEnable事件
public class LightingController : MonoBehaviour
{
    public float metalDarken;
    public Color mainLightCol = Color.white;
    public Vector4 specParams = new Vector4(10.0f, 1.0f, 30.0f, 1.0f);
    public float skylightInt = 1.0f;
    public Vector4 reflectParams = new Vector4(7.0f, 1.0f, 1.0f, 1.0f);
    public float fresnelPow = 5.0f;
    public Color emissionCol = Color.white;

    private void OnEnable()
    {
        UpdateGlobalProperties();
    }

    // 更新Shader全局参数
    public void UpdateGlobalProperties()
    {
        // 注意: Shader的各Set接口都支持按参数名或按参数ID设置 后者性能较好 Runtime代码需先缓存ID 避免按名Set
        Shader.SetGlobalFloat("_G_MetalDarken", metalDarken);
        Shader.SetGlobalColor("_G_MainLightCol", mainLightCol);
        Shader.SetGlobalVector("_G_SpecParams", specParams);
        Shader.SetGlobalFloat("_G_SkyLightInt", skylightInt);
        Shader.SetGlobalVector("_G_ReflectParams", reflectParams);
        Shader.SetGlobalFloat("_G_FresnelPow", metalDarken);
        Shader.SetGlobalColor("_G_EmissionCol", emissionCol);
    }
        
    // 结构: 保存lightmap信息
    private struct LightmapsInfo
    {
        // 数量
        public readonly int lightmapsCount;
        // 信息<路径, 纹理对象>
        public readonly Dictionary<string, Texture2D> lightmapsInfo;
        // 资产路径
        public readonly string assetPath;
        // 构造方法
        public LightmapsInfo(LightmapData[] lightmapsData)
        {
            // 获取lightmap数量
            lightmapsCount = lightmapsData.Length;
            // 创建字典<路径, 纹理>并填充
            lightmapsInfo = new Dictionary<string, Texture2D>();
            var path = "";
            foreach (var data in lightmapsData)
            {
                var texture = data.lightmapColor;
                path = AssetDatabase.GetAssetPath(texture);
                lightmapsInfo.Add(path, texture);
            }
            // 获取lightmap资产路径
            assetPath = lightmapsCount < 0 ? "" : Path.GetDirectoryName(path);
            // 打印日志
            if (lightmapsCount < 0)
            {
                Debug.Log("LightmapsInfo: lightmap信息为空.");
            }
            else
            {
                Debug.Log("LightmapsInfo: lightmap数量: " + lightmapsCount);
                Debug.Log("LightmapsInfo: 资产路径: " + assetPath);
            }
        }
    }
    
    // 结构: lightmaps缓存
    private struct LightmapsBuffer
    {
        // lightmap缓存类型
        public enum BufferType
        {
            MainLight,  // 主光光照: BufferA
            SkyLight,   // 天光光照: BufferB
            EmissionGI, // 自发光GI: BufferC
            Lightmap    // 合成Lightmap
        }
        // lightmap缓存
        private Texture2D[] _bufferA;
        private Texture2D[] _bufferB;
        private Texture2D[] _bufferC;
        private Texture2D[] _lightmap;
        // 清理缓存(纹理对象内存占用较大建议手动释放)
        private void ClearBuffer(BufferType type)
        {
            switch (type)
            {
                case BufferType.MainLight:
                    if (_bufferA == null) return;
                    foreach (var texture in _bufferA)
                        DestroyImmediate(texture);
                    _bufferA = null;
                    Debug.Log("LightmapsBuffer: 缓存A已清理.");
                    return;
                case BufferType.SkyLight:
                    if (_bufferB == null) return;
                    foreach (var texture in _bufferB)
                        DestroyImmediate(texture);
                    _bufferB = null;
                    Debug.Log("LightmapsBuffer: 缓存B已清理.");
                    return;
                case BufferType.EmissionGI:
                    if (_bufferC == null) return;
                    foreach (var texture in _bufferC)
                        DestroyImmediate(texture);
                    _bufferC = null;
                    Debug.Log("LightmapsBuffer: 缓存C已清理.");
                    return;
                case BufferType.Lightmap:
                    if (_lightmap == null) return;
                    foreach (var texture in _lightmap)
                        DestroyImmediate(texture);
                    _lightmap = null;
                    Debug.Log("LightmapsBuffer: Lightmap已清理.");
                    return;
                default:
                    return;
            }
        }
        // 清理所有缓存
        public void Clear()
        {
            if (_bufferA != null)
            {
                foreach (var texture in _bufferA)
                    DestroyImmediate(texture);
                _bufferA = null;
            }
            if (_bufferB != null)
            {
                foreach (var texture in _bufferB)
                    DestroyImmediate(texture);
                _bufferB = null;
            }
            if (_bufferC != null)
            {
                foreach (var texture in _bufferC)
                    DestroyImmediate(texture);
                _bufferC = null;
            }
            if (_lightmap != null)
            {
                foreach (var texture in _lightmap)
                    DestroyImmediate(texture);
                _lightmap = null;
            }
            Debug.Log("LightmapsBuffer: 缓存已全部清理.");
        }
        // 从LightmapInfo写入缓存
        public void WriteBuffer(LightmapsInfo info, BufferType type)
        {
            // 拒绝合成Lightmap缓存的写入
            if (type == BufferType.Lightmap) return;
            // 清理缓存
            ClearBuffer(type);
            // 创建缓存并从Info中复制纹理
            var lightmapsCount = info.lightmapsCount;
            var buffer = new Texture2D[lightmapsCount];
            for (var i = 0; i < lightmapsCount; i++)
            {
                var lightmap = info.lightmapsInfo.Values.ElementAt(i);
                buffer[i] = new Texture2D(lightmap.width, lightmap.height, lightmap.format, false);
                Graphics.CopyTexture(lightmap, 0, 0, buffer[i], 0, 0);
            }
            // 指定到目标缓存
            switch (type)
            {
                case BufferType.MainLight:
                    _bufferA = buffer;
                    Debug.Log("LightmapsBuffer: 缓存A已写入.");
                    break;
                case BufferType.SkyLight:
                    _bufferB = buffer;
                    Debug.Log("LightmapsBuffer: 缓存B已写入.");
                    break;
                case BufferType.EmissionGI:
                    _bufferC = buffer;
                    Debug.Log("LightmapsBuffer: 缓存C已写入.");
                    break;
                default:
                    return;
            }
        }
        // 从缓存创建lightmap
        public void CreateLightmaps()
        {
            // 检查各缓存是否为空
            if (_bufferA == null || _bufferB == null || _bufferC == null)
            {
                Debug.Log("LightmapsBuffer错误: 存在空缓存!");
                return;
            }
            // 检查各缓存长度是否有效
            var lightmapsCount = _bufferA.Length;
            if (lightmapsCount < 1)
            {
                Debug.Log("LightmapsBuffer错误: 存在缓存长度为0!");
                return;
            }
            // 检查各缓存长度是否一致
            if (_bufferB.Length != lightmapsCount ||
                _bufferC.Length != lightmapsCount)
            {
                Debug.Log("LightmapsBuffer错误: 各缓存数量不一致!");
                return;
            }
            // 检查各缓存纹理尺寸格式是否一致
            var lightmapsWidth = new int[lightmapsCount];
            var lightmapsHeight = new int[lightmapsCount];
            var lightmapsFormat = _bufferA[0].format;
            for (var i = 0; i < lightmapsCount; i++)
            {
                // 获取各纹理
                var texA = _bufferA[i];
                var texB = _bufferB[i];
                var texC = _bufferC[i];
                // 获取基准纹理尺寸
                lightmapsWidth[i] = texA.width;
                lightmapsHeight[i] = texA.height;
                // 判定纹理尺寸是否合规
                if (texB.width != lightmapsWidth[i] || texB.height != lightmapsHeight[i] || texB.format != lightmapsFormat ||
                    texC.width != lightmapsWidth[i] || texC.height != lightmapsHeight[i] || texC.format != lightmapsFormat)
                {
                    Debug.Log("LightmapsBuffer错误: 各缓存纹理尺寸格式不一致!");
                    return;
                }
            }
            // 创建并写入新的lightmap
            ClearBuffer(BufferType.Lightmap);
            _lightmap = new Texture2D[lightmapsCount];
            for (var i = 0; i < lightmapsCount; i++)
            {
                // 获取纹理尺寸
                var width = lightmapsWidth[i];
                var height = lightmapsHeight[i];
                // 创建纹理并写入颜色
                var lightmap = new Texture2D(width, height, lightmapsFormat, false);
                for (var x = 0; x < width; x++)
                {
                    for (var y = 0; y < height; y++)
                    {
                        var colA = _bufferA[i].GetPixel(x, y);
                        var colB = _bufferB[i].GetPixel(x, y);
                        var colC = _bufferC[i].GetPixel(x, y);
                        var newCol = new Color(colA.r, colB.r, colC.r, 1.0f);
                        lightmap.SetPixel(x, y, newCol.linear);
                    }
                }
                // 应用纹理修改
                lightmap.Apply();
                // 指定给数组
                _lightmap[i] = lightmap;
            }
        }
        // 覆盖场景lightmap
        public void OverrideLightmaps(LightmapsInfo info)
        {
            // 判定lightmap缓存是否为空
            if (_lightmap == null)
            {
                Debug.Log("LightmapsOverrider: lightmap缓存为空 覆盖失败.");
                return;
            }
            // 判定缓存纹理数与目标是否一直
            var lightmapsInfo = info.lightmapsInfo;
            var lightmapsCount = lightmapsInfo.Count;
            if (_lightmap.Length != lightmapsCount)
            {
                Debug.Log("LightmapsOverrider: 缓存纹理数量与目标不一致 覆盖失败.");
                return;
            }
            // 覆盖并更新场景lightmap
            for (var i = 0; i < lightmapsCount; i++)
            {
                var bytes = _lightmap[i].EncodeToEXR(Texture2D.EXRFlags.CompressZIP);
                File.WriteAllBytes(lightmapsInfo.Keys.ElementAt(i), bytes);
                AssetDatabase.Refresh();
            }
        }
    }

    // 烘培方式枚举
    public enum BakeMode
    {
        Default,
        BakeMainLight,
        BakeSkyLight,
        BakeEmissionGI
    }

    // 准备烘培环境
    public void ArrangeBakeScene(BakeMode mode)
    {
        // 获取主光
        var mainlight = RenderSettings.sun;
        if (mainlight == null)
        {
            Debug.Log("LightmapsBaker: Lighting设置缺少主光 烘培环境准备失败.");
            return;
        }
        // 按给定模式配置烘培环境
        switch (mode)
        {
            case BakeMode.Default:
                // 关闭主光
                mainlight.enabled = true;
                // 设置环境
                RenderSettings.ambientMode = AmbientMode.Skybox;
                RenderSettings.ambientIntensity = 1.0f;
                // 设置Shader全局分支
                Shader.DisableKeyword("_BAKE_MAINLIGHT");
                Shader.DisableKeyword("_BAKE_SKYLIGHT");
                Shader.DisableKeyword("_BAKE_EMISSIONGI");
                break;
            case BakeMode.BakeMainLight:
                // 开启主光
                mainlight.enabled = true;
                // 设置主光
                mainlight.color = Color.white;
                mainlight.intensity = 1.0f;
                mainlight.lightmapBakeType = LightmapBakeType.Baked;
                var staticFlags = StaticEditorFlags.ContributeGI | StaticEditorFlags.ReflectionProbeStatic;
                GameObjectUtility.SetStaticEditorFlags(mainlight.gameObject, staticFlags);
                // 设置环境
                RenderSettings.ambientMode = AmbientMode.Flat;
                RenderSettings.ambientSkyColor = Color.black;
                // 设置Shader全局分支
                Shader.EnableKeyword("_BAKE_MAINLIGHT");
                Shader.DisableKeyword("_BAKE_SKYLIGHT");
                Shader.DisableKeyword("_BAKE_EMISSIONGI");
                break;
            case BakeMode.BakeSkyLight:
                // 开启主光
                mainlight.enabled = false;
                // 设置环境
                RenderSettings.ambientMode = AmbientMode.Flat;
                RenderSettings.ambientSkyColor = Color.white;
                // 设置Shader全局分支
                Shader.DisableKeyword("_BAKE_MAINLIGHT");
                Shader.EnableKeyword("_BAKE_SKYLIGHT");
                Shader.DisableKeyword("_BAKE_EMISSIONGI");
                break;
            case BakeMode.BakeEmissionGI:
                // 开启主光
                mainlight.enabled = false;
                // 设置环境
                RenderSettings.ambientMode = AmbientMode.Flat;
                RenderSettings.ambientSkyColor = Color.black;
                // 设置Shader全局分支
                Shader.DisableKeyword("_BAKE_MAINLIGHT");
                Shader.DisableKeyword("_BAKE_SKYLIGHT");
                Shader.EnableKeyword("_BAKE_EMISSIONGI");
                break;
        }
    }

    // 烘培方法
    public void Bake(BakeMode mode)
    {
        // 清理旧的烘培信息
        Lightmapping.Clear();
        // 准备烘培环境
        ArrangeBakeScene(mode);
        // 执行烘培
        Lightmapping.Bake();
        // 打印日志
        switch (mode)
        {
            case BakeMode.BakeMainLight:
                Debug.Log("LightmapsBaker: 主光已烘培.");
                break;
            case BakeMode.BakeSkyLight:
                Debug.Log("LightmapsBaker: 天光已烘培.");
                break;
            case BakeMode.BakeEmissionGI:
                Debug.Log("LightmapsBaker: 自发光GI已烘培.");
                break;
        }
    }
    
    // 烘培反射探头方法
    private void BakeReflectProbe()
    {
        var allProbe = FindObjectsOfType<ReflectionProbe>();
        foreach (var probe in allProbe)
        {
            var path = AssetDatabase.GetAssetPath(probe.texture);
            Lightmapping.BakeReflectionProbe(probe, path);
        }
        AssetDatabase.Refresh();
    }

    // 多重烘培方法
    public void MultiBake()
    {
        // 创建lightmap缓存
        var buffer = new LightmapsBuffer();
        // 烘培主光并写入缓存
        Bake(BakeMode.BakeMainLight);
        var info = new LightmapsInfo(LightmapSettings.lightmaps);
        buffer.WriteBuffer(info, LightmapsBuffer.BufferType.MainLight);
        // 烘培天光并写入缓存
        Bake(BakeMode.BakeSkyLight);
        buffer.WriteBuffer(info, LightmapsBuffer.BufferType.SkyLight);
        // 烘培自发光并写入缓存
        Bake(BakeMode.BakeEmissionGI);
        buffer.WriteBuffer(info, LightmapsBuffer.BufferType.EmissionGI);
        // 从缓存创建lightmap
        buffer.CreateLightmaps();
        // 覆盖场景lightmaps
        buffer.OverrideLightmaps(info);
        // 清空lightmap缓存
        buffer.Clear();
        // 恢复场景光照环境
        ArrangeBakeScene(BakeMode.Default);
        // 更新全局参数
        UpdateGlobalProperties();
        // 烘培反射探头
        BakeReflectProbe();
    }

    [ContextMenu("教学·设置全局变量")]
    private void Test_SetGlobalParam()
    {
        // 获取当前值
        var origentCol = Shader.GetGlobalColor("_G_TestCol");
        // 当前不为红也不为绿时 上红色
        if (origentCol != Color.red && origentCol != Color.green)
        {
            Shader.SetGlobalColor("_G_TestCol", Color.red);
            return;
        }
        // 当前为红绿时 来回切
        if (origentCol == Color.red)
            Shader.SetGlobalColor("_G_TestCol", Color.green);
        if (origentCol == Color.green)
            Shader.SetGlobalColor("_G_TestCol", Color.red);
    }
    
    [ContextMenu("教学·设置全局分支")]
    private void Test_SetGlobalKeyword()
    {
        // 三个keyword都未激活时 激活A
        if (Shader.IsKeywordEnabled("_TESTA") == false &&
            Shader.IsKeywordEnabled("_TESTB") == false &&
            Shader.IsKeywordEnabled("_TESTC") == false)
        {
            Shader.EnableKeyword("_TESTA");
            return;
        }
        // 存在激活时 轮着切
        if (Shader.IsKeywordEnabled("_TESTA"))
        {
            Shader.DisableKeyword("_TESTA");
            Shader.EnableKeyword("_TESTB");
            return;
        }
        if (Shader.IsKeywordEnabled("_TESTB"))
        {
            Shader.DisableKeyword("_TESTB");
            Shader.EnableKeyword("_TESTC");
            return;
        }
        if (Shader.IsKeywordEnabled("_TESTC"))
        {
            Shader.DisableKeyword("_TESTC");
            Shader.EnableKeyword("_TESTA");
        }
    }
}
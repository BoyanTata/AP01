using UnityEditor;
using UnityEngine;

// 自发光材质GUI
public class EmissionShaderGUI : ShaderGUI
{
    // GUI绘制方法
    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] props)
    {
        // 获取目标Material
        var material = materialEditor.target as Material;
        // 判空
        if (material == null) return;
        // 绘制默认GUI
        base.OnGUI(materialEditor, props);
        // 追加自发光GI开关
        var ifEmissionGIOn = EditorGUILayout.Toggle(
            "开启自发光GI",
            material.globalIlluminationFlags == MaterialGlobalIlluminationFlags.AnyEmissive);
        material.globalIlluminationFlags = ifEmissionGIOn
            ? MaterialGlobalIlluminationFlags.AnyEmissive
            : MaterialGlobalIlluminationFlags.EmissiveIsBlack;
    }
}
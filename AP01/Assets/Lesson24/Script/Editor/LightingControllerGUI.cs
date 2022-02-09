using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(LightingController))]
public class LightingControllerGUI : Editor
{
    // 重载GUI绘制方法
    public override void OnInspectorGUI()
    {
        // 获取控制器
        var controller = target as LightingController;
        // 判空
        if(controller == null) return;
        // 绘制功能按钮区
        DrawFunctionButtons(controller);
        // 绘制参数面板区
        DrawGlobalProperties(controller);
    }
    // 绘制功能按钮GUI
    private void DrawFunctionButtons(LightingController controller)
    {
        // 第一行 多重烘培大按钮
        if (GUILayout.Button("禁术·多重烘培"))
            controller.MultiBake();
        // 第二行 搞个水平布局
        EditorGUILayout.BeginHorizontal();
        {
            // 实时光照启动按钮
            if (GUILayout.Button("境·即时"))
            {
                Lightmapping.Clear();
                controller.ArrangeBakeScene(LightingController.BakeMode.Default);
            }
            // 烘培并预览主光成分按钮
            if (GUILayout.Button("境·主光"))
                controller.Bake(LightingController.BakeMode.BakeMainLight);
            // 烘培并预览天光成分按钮
            if (GUILayout.Button("境·天光"))
                controller.Bake(LightingController.BakeMode.BakeSkyLight);
            // 烘培并预览自发光GI成分按钮
            if (GUILayout.Button("境·灯映"))
                controller.Bake(LightingController.BakeMode.BakeEmissionGI);
        }
        EditorGUILayout.EndHorizontal();
    }
    // 组开关变量
    private bool _groupAToggle;
    private bool _groupBToggle;
    private bool _groupCToggle;
    private bool _groupDToggle;
    private bool _groupEToggle;
    // 绘制Shader全局参数GUI
    private void DrawGlobalProperties(LightingController controller)
    {
        // 开始参数修改检测
        EditorGUI.BeginChangeCheck();
        {
            // 参数组A: 材质属性
            _groupAToggle = EditorGUILayout.BeginFoldoutHeaderGroup(_groupAToggle, "材质属性");
            if (_groupAToggle)
            {
                controller.metalDarken = EditorGUILayout.Slider(
                    "金属压暗",
                    controller.metalDarken,
                    0.0f, 5.0f);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
            // 参数组B: 主光配置
            _groupBToggle = EditorGUILayout.BeginFoldoutHeaderGroup(_groupBToggle, "主光配置");
            if (_groupBToggle)
            {
                controller.mainLightCol = EditorGUILayout.ColorField(
                    "主光颜色",
                    controller.mainLightCol);
                controller.specParams = EditorGUILayout.Vector4Field(
                    "高光参数",
                    controller.specParams);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
            // 参数组C: 天光配置
            _groupCToggle = EditorGUILayout.BeginFoldoutHeaderGroup(_groupCToggle, "天光配置");
            if (_groupCToggle)
            {
                controller.skylightInt = EditorGUILayout.Slider(
                    "天光强度",
                    controller.skylightInt,
                    0.0f, 5.0f);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
            // 参数组D: 反射配置
            _groupDToggle = EditorGUILayout.BeginFoldoutHeaderGroup(_groupDToggle, "反射配置");
            if (_groupDToggle)
            {
                controller.reflectParams = EditorGUILayout.Vector4Field(
                    "反射参数",
                    controller.reflectParams);

                controller.fresnelPow = EditorGUILayout.Slider(
                    "菲涅尔次幂",
                    controller.fresnelPow,
                    0.1f, 50.0f);
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
            // 参数组E: 自发光GI配置
            _groupEToggle = EditorGUILayout.BeginFoldoutHeaderGroup(_groupEToggle, "自发光GI配置");
            if (_groupEToggle)
            {
                EditorGUILayout.BeginFadeGroup(1.0f);
                controller.emissionCol = EditorGUILayout.ColorField(
                    "自发光GI颜色",
                    controller.emissionCol);
                EditorGUILayout.EndFadeGroup();
            }
            EditorGUILayout.EndFoldoutHeaderGroup();
        }
        // 结束参数修改检测 变则设置Shader全局参数 参数非常多时逐个或按组做此操作
        if (EditorGUI.EndChangeCheck())
        {
            controller.UpdateGlobalProperties();
            EditorUtility.SetDirty(controller);
        }
    }
}

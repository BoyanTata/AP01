// 引用命名空间
using System;       // 主命名空间 包含所有.net基础类型和通用类型 这里用于获取系统时间
using UnityEngine;  // Unity引擎命名空间 这里需使用UnityEngine定义的相关类和类方法

// Clock类 继承自MonoBehaviour
public class Clock : MonoBehaviour
{
    // ------ Public ------
    public Material clockMat;           // 目标材质
    // ------ Private ------
    private bool valid;                 // 有效性标识
    private int hourAnglePropID;        // 材质属性ID
    private int minuteAnglePropID;      // 同上
    private int secondAnglePropID;      // 同上

    // Start is called before the first frame update
    // 脚本开始运行时调用
    void Start()
    {
        // 如果目标材质空 则跳过初始化
        if(clockMat != null)
        {
            // 缓冲材质属性ID
            hourAnglePropID = Shader.PropertyToID("_HourHandAngle");
            minuteAnglePropID = Shader.PropertyToID("_MinuteHandAngle");
            secondAnglePropID = Shader.PropertyToID("_SecondHandAngle");
            // 如Get到所有材质属性 标识有效性为True
            if(clockMat.HasProperty(hourAnglePropID) && clockMat.HasProperty(minuteAnglePropID) && clockMat.HasProperty(secondAnglePropID))
                valid = true;
        }
    }

    // Update is called once per frame
    // 脚本逐帧调用
    void Update()
    {
        // 判断有效性 无效则跳过Update逻辑
        if(!valid) return;
        // 处理秒针
        int second = DateTime.Now.Second;                      // 获取系统时间：秒
        float secondAngle = second / 60.0f * 360.0f;           // 换算为指针角度
        clockMat.SetFloat(secondAnglePropID, secondAngle);     // 更新材质相关属性
        // 处理分针
        int minute = DateTime.Now.Minute;
        float minuteAngle = minute / 60.0f * 360.0f;
        clockMat.SetFloat(minuteAnglePropID, minuteAngle);
        // 处理时针
        int hour = DateTime.Now.Hour;
        float hourAngle = (hour % 12) / 12.0f * 360.0f + minuteAngle / 360.0f * 30.0f;
        clockMat.SetFloat(hourAnglePropID, hourAngle);
    }
}
package com.cn.entity;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class aaaa {

	public static void main(String[] args) {
		//生成6位随机数字
        System.out.println((int)((Math.random()*9+1)*100000));
        //生成5位随机数字
        System.out.println((int)((Math.random()*9+1)*10000));
        //生成4位随机数字
        System.out.println((int)((Math.random()*9+1)*1000));
        //生成3位随机数字
        System.out.println((int)((Math.random()*9+1)*100));
        //生成2位随机数字
        System.out.println((int)((Math.random()*9+1)*10));
        //生成1位随机数字
        System.out.println((int)((Math.random()*9+1)));
		// 创建与微软应用程序的新连接。传入的参数是注册表中注册的程序的名称。
		ActiveXComponent sap = new ActiveXComponent("Sapi.SpVoice");
		try {
			// 音量 0-100
			sap.setProperty("Volume", new Variant(100));
			// 语音朗读速度 -10 到 +10
			sap.setProperty("Rate", new Variant(-2));
			// 获取执行对象
			Dispatch sapo = sap.getObject();
			String a="666666666666666666666666666666666666666666666666666666666666666666666";
			// 执行朗读
			Dispatch.call(sapo, "Speak", new Variant(a));
			// 关闭执行对象
			sapo.safeRelease();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭应用程序连接
			sap.safeRelease();
		}

	}

}

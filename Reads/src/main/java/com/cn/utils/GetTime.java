package com.cn.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTime {
	public static String getStrDate(String pattern){
		SimpleDateFormat sdt=new SimpleDateFormat(pattern);
		String sdr=sdt.format(new Date());
		return sdr;
	}
}

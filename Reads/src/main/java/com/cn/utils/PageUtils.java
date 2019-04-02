package com.cn.utils;

public class PageUtils {
	
	private int rows=4;//每页显示的记录数
	
	private int currPage=1;//当前页
	
	private int countPage;//总页数
	//保存查询后的总条数
	private int totalNumber;//总记录数
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getCountPage() {
		return countPage;
	}
	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {//计算总页数
		if (totalNumber>0) {
			this.totalNumber = totalNumber;
			countPage=(totalNumber%4==0)?(totalNumber/4):(totalNumber/4+1);
		}
	}
	

}

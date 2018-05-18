package com.marco.music.common.page;

import java.io.Serializable;

/**
 * @author Marco
 * @date 2017年5月25日 上午11:05:07
 * 分页
 */
public class Page implements Serializable {

	private static final long serialVersionUID = 1L;

	//当前页码
    private Integer curPage = 1;
    
    //每页记录数
    private int fetchSize = 15;
    
    //总记录数
    private int allRecordNum = 0;
    
    //总页数
    private int totalPage = 1;
	
    public int getStartRow() {
        int startRow = (curPage - 1) * fetchSize;
        if(startRow < 0 || startRow > allRecordNum) {
        	startRow = 0;
        }
        return startRow;
    }

	public Integer getCurPage() {
		return curPage;
	}

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}

	public int getFetchSize() {
		return fetchSize;
	}

	public void setFetchSize(int fetchSize) {
		this.fetchSize = fetchSize;
	}

	public int getAllRecordNum() {
		return allRecordNum;
	}

	public void setAllRecordNum(int allRecordNum) {
		this.allRecordNum = allRecordNum;
	}

	//获取所有页的方法需要特地去写
	public int getTotalPage() {
		int total = (allRecordNum - 1) / fetchSize + 1;
        return total;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
    
}

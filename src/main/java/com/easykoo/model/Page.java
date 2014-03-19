package com.easykoo.model;

/**
 * Feb 22, 2014    Steven
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 对分页的基本数据进行一个简单的封装
 */
public class Page<T> {
    private boolean pageActived=false;
    private int displayStart;
    private int pageNo = 1;//页码，默认是第一页
    private int pageSize = 10;//每页显示的记录数，默认是10
    private List<SortProperty> sortPropertyList;
    private int totalRecord;//总记录数
    private int totalPage;//总页数
    private List<T> results;//对应的当前页记录
    private Map<String, Object> params = new HashMap<String, Object>();//其他的参数我们把它分装成一个Map对象

    public boolean isPageActived() {
        return pageActived;
    }

    public void setPageActived(boolean pageActived) {
        this.pageActived = pageActived;
    }

    public int getDisplayStart() {
        return displayStart;
    }

    public void setDisplayStart(int displayStart) {
        if ((displayStart + 1) / pageSize < 1)
            setPageNo(1);
        else
            setPageNo(((displayStart + 1) / pageSize) + 1);
        this.displayStart = displayStart;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        if (pageNo < 1) {
            pageNo = 1;
        }
        this.pageNo = pageNo;
    }

    public void setPageNo(String pageNo) {
        try{
            int pageNum = Integer.parseInt(pageNo);
            setPageNo(pageNum);
        } catch (NumberFormatException e){
            setPageNo(1);
        }
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public void setPageSize(String pageSize) {
        try{
            int pageSizeNum = Integer.parseInt(pageSize);
            setPageSize(pageSizeNum);
        } catch (NumberFormatException e){
            setPageSize(10);
        }
    }

    public List<SortProperty> getSortPropertyList() {
        if (sortPropertyList == null) {
            sortPropertyList = new ArrayList<SortProperty>();
        }
        return sortPropertyList;
    }

    public void setSortPropertyList(List<SortProperty> sortPropertyList) {
        this.sortPropertyList = sortPropertyList;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
        //在设置总页数的时候计算出对应的总页数，在下面的三目运算中加法拥有更高的优先级，所以最后可以不加括号。
        int totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
        this.setTotalPage(totalPage);
        if (pageNo > totalPage) {
            setPageNo(totalPage);
        }
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getResults() {
        return results;
    }

    public void setResults(List<T> results) {
        this.results = results;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public void addSortProperties(String column, String direction) {
        SortProperty sortProperty = new SortProperty(column, direction);
        getSortPropertyList().add(sortProperty);
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Page [pageNo=").append(pageNo).append(", pageSize=")
                .append(pageSize).append(", results=").append(results).append(
                ", totalPage=").append(totalPage).append(
                ", totalRecord=").append(totalRecord).append("]");
        return builder.toString();
    }

    public class SortProperty {
        private String column;
        private String direction;

        public String getColumn() {
            return column;
        }

        public void setColumn(String column) {
            this.column = column;
        }

        public String getDirection() {
            return direction;
        }

        public void setDirection(String direction) {
            this.direction = direction;
        }

        public SortProperty(String column, String direction) {
            this.column = column;
            this.direction = direction;
        }
    }

}
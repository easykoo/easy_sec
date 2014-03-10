package com.easykoo.model;

/**
 * Feb 22, 2014    Steven
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class DataTablesResponse<T>
    implements Serializable {
  @JsonProperty(value = "iTotalRecords")
  public int totalRecords;

  @JsonProperty(value = "iTotalDisplayRecords")
  public int totalDisplayRecords;

  @JsonProperty(value = "sEcho")
  public int echo;

  @JsonProperty(value = "sColumns")
  public String columns;

  @JsonProperty(value = "aaData")
  public List<T> data = new ArrayList<T>();

  public DataTablesResponse() {}

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getTotalDisplayRecords() {
        return totalDisplayRecords;
    }

    public void setTotalDisplayRecords(int totalDisplayRecords) {
        this.totalDisplayRecords = totalDisplayRecords;
    }

    public int getEcho() {
        return echo;
    }

    public void setEcho(int echo) {
        this.echo = echo;
    }

    public String getColumns() {
        return columns;
    }

    public void setColumns(String columns) {
        this.columns = columns;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}

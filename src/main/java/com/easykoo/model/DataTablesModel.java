package com.easykoo.model;

/**
 * Feb 22, 2014    Steven
 */

import org.codehaus.jackson.annotate.JsonProperty;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * {
 * "sEcho":1,
 * "iColumns":7,
 * "sColumns":"",
 * "iDisplayStart":0,
 * "iDisplayLength":10,
 * "amDataProp":[0,1,2,3,4,5,6],
 * "sSearch":"",
 * "bRegex":false,
 * "asSearch":["","","","","","",""],
 * "abRegex":[false,false,false,false,false,false,false],
 * "abSearchable":[true,true,true,true,true,true,true],
 * "iSortingCols":1,
 * "aiSortCol":[0],
 * "asSortDir":["asc"],
 * "abSortable":[true,true,true,true,true,true,true]
 * }
 *
 * @author stevens
 */
public class DataTablesModel<T> implements Serializable {

    @JsonProperty(value = "sEcho")
    public int echo;

    @JsonProperty(value = "iColumns")
    public int numColumns;

    @JsonProperty(value = "sColumns")
    public String columns;

    @JsonProperty(value = "iDisplayStart")
    public int displayStart;

    @JsonProperty(value = "iDisplayLength")
    public int displayLength;

    //has to be revisited for Object type dataProps.
    @JsonProperty(value = "amDataProp")
    public List<Integer> dataProp;

    @JsonProperty(value = "sSearch")
    public String searchQuery;

    @JsonProperty(value = "asSearch")
    public List<String> columnSearches;

    @JsonProperty(value = "bRegex")
    public boolean hasRegex;

    @JsonProperty(value = "abRegex")
    public List<Boolean> regexColumns;

    @JsonProperty(value = "abSearchable")
    public List<Boolean> searchColumns;

    @JsonProperty(value = "iSortingCols")
    public int sortingCols;

    @JsonProperty(value = "aiSortCol")
    public List<Integer> sortedColumns;

    @JsonProperty(value = "asSortDir")
    public List<String> sortDirections;

    @JsonProperty(value = "abSortable")
    public List<Boolean> sortableColumns;

    @JsonProperty(value = "iTotalRecords")
    public int totalRecords;

    @JsonProperty(value = "iTotalDisplayRecords")
    public int totalDisplayRecords;

    @JsonProperty(value = "aaData")
    public List<T> data = new ArrayList<T>();

    public DataTablesModel() {
    }

    public int getEcho() {
        return echo;
    }

    public void setEcho(int echo) {
        this.echo = echo;
    }

    public int getNumColumns() {
        return numColumns;
    }

    public void setNumColumns(int numColumns) {
        this.numColumns = numColumns;
    }

    public String getColumns() {
        return columns;
    }

    public void setColumns(String columns) {
        this.columns = columns;
    }

    public int getDisplayStart() {
        return displayStart;
    }

    public void setDisplayStart(int displayStart) {
        this.displayStart = displayStart;
    }

    public int getDisplayLength() {
        return displayLength;
    }

    public void setDisplayLength(int displayLength) {
        this.displayLength = displayLength;
    }

    public List<Integer> getDataProp() {
        return dataProp;
    }

    public void setDataProp(List<Integer> dataProp) {
        this.dataProp = dataProp;
    }

    public String getSearchQuery() {
        return searchQuery;
    }

    public void setSearchQuery(String searchQuery) {
        this.searchQuery = searchQuery;
    }

    public List<String> getColumnSearches() {
        return columnSearches;
    }

    public void setColumnSearches(List<String> columnSearches) {
        this.columnSearches = columnSearches;
    }

    public boolean isHasRegex() {
        return hasRegex;
    }

    public void setHasRegex(boolean hasRegex) {
        this.hasRegex = hasRegex;
    }

    public List<Boolean> getRegexColumns() {
        return regexColumns;
    }

    public void setRegexColumns(List<Boolean> regexColumns) {
        this.regexColumns = regexColumns;
    }

    public List<Boolean> getSearchColumns() {
        return searchColumns;
    }

    public void setSearchColumns(List<Boolean> searchColumns) {
        this.searchColumns = searchColumns;
    }

    public int getSortingCols() {
        return sortingCols;
    }

    public void setSortingCols(int sortingCols) {
        this.sortingCols = sortingCols;
    }

    public List<Integer> getSortedColumns() {
        return sortedColumns;
    }

    public void setSortedColumns(List<Integer> sortedColumns) {
        this.sortedColumns = sortedColumns;
    }

    public List<String> getSortDirections() {
        return sortDirections;
    }

    public void setSortDirections(List<String> sortDirections) {
        this.sortDirections = sortDirections;
    }

    public List<Boolean> getSortableColumns() {
        return sortableColumns;
    }

    public void setSortableColumns(List<Boolean> sortableColumns) {
        this.sortableColumns = sortableColumns;
    }

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

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
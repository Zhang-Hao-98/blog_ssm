package com.J2007.utils;

import java.util.Arrays;

public class WangEditor {
    private Integer errno;
    private String[] data;

    public WangEditor() {
    }

    public WangEditor(Integer errno, String[] data) {
        this.errno = errno;
        this.data = data;
    }

    public Integer getErrno() {
        return errno;
    }

    public void setErrno(Integer errno) {
        this.errno = errno;
    }

    public String[] getData() {
        return data;
    }

    public void setData(String[] data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "WangEditor{" +
                "errno=" + errno +
                ", data=" + Arrays.toString(data) +
                '}';
    }
}

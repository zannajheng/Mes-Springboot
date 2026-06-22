package com.wangziyang.mes.technology.request;

public class SpFlowReq {

    private Long current = 1L;
    private Long size = 10L;
    private String flowLike;

    public Long getCurrent() {
        return current;
    }

    public void setCurrent(Long current) {
        this.current = current;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public String getFlowLike() {
        return flowLike;
    }

    public void setFlowLike(String flowLike) {
        this.flowLike = flowLike;
    }
}

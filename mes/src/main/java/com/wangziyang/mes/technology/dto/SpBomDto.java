package com.wangziyang.mes.technology.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.wangziyang.mes.technology.entity.SpBom;
import com.wangziyang.mes.technology.entity.SpBomItem;

import java.util.List;

/**
 * BOM数据传输对象，包含子项集合
 *
 * @author wangziyang
 * @since 20200316
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class SpBomDto extends SpBom {

    private List<SpBomItem> spBomItems;

    public List<SpBomItem> getSpBomItems() {
        return spBomItems;
    }

    public void setSpBomItems(List<SpBomItem> spBomItems) {
        this.spBomItems = spBomItems;
    }
}

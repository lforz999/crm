package com.bus.until;

import lombok.Data;

import java.util.List;

@Data
public class MenuData {
    //菜单显示的名称
    private String text;
    //菜单对应的链接
    private String href;
    //当前菜单的子菜单
    private List<MenuData> nodes;
}

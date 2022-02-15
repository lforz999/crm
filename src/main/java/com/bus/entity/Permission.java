package com.bus.entity;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Table(name="permission")
public class Permission implements Serializable,Cloneable{
    /** 权限id */
    @Id
    private Integer permissionid ;
    /** 权限名字 */
    private String pname ;
    /** 权限的请求地址 */
    private String purl ;
    /** 菜单 */
    private Integer ismenu ;
    /** 所属父类 */
    private Integer parentid ;
    /** 权限信息 */
    private String pinfo ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新时间 */
    private Date updatedTime ;
    //一对多: 用来描述当前权限的子权限
    private List<Permission> list;

    private RolePermission rp;

    public Permission() {
    }

    public Permission(Integer permissionid) {
        this.permissionid = permissionid;
    }

    public Permission(String pname) {
        this.pname = pname;
    }

    public Permission(String pname, String purl, Integer ismenu, Integer parentid, String pinfo) {
        this.pname = pname;
        this.purl = purl;
        this.ismenu = ismenu;
        this.parentid = parentid;
        this.pinfo = pinfo;
    }

    public Permission(Integer permissionid, String pname, String purl, Integer ismenu, Integer parentid, String pinfo) {
        this.permissionid = permissionid;
        this.pname = pname;
        this.purl = purl;
        this.ismenu = ismenu;
        this.parentid = parentid;
        this.pinfo = pinfo;
    }

    public RolePermission getRp() {
        return rp;
    }

    public void setRp(RolePermission rp) {
        this.rp = rp;
    }

    public List<Permission> getList() {
        return list;
    }

    public void setList(List<Permission> list) {
        this.list = list;
    }

    /** 权限id */
    public Integer getPermissionid(){
        return this.permissionid;
    }
    /** 权限id */
    public void setPermissionid(Integer permissionid){
        this.permissionid = permissionid;
    }
    /** 权限名字 */
    public String getPname(){
        return this.pname;
    }
    /** 权限名字 */
    public void setPname(String pname){
        this.pname = pname;
    }
    /** 权限的请求地址 */
    public String getPurl(){
        return this.purl;
    }
    /** 权限的请求地址 */
    public void setPurl(String purl){
        this.purl = purl;
    }
    /** 菜单 */
    public Integer getIsmenu(){
        return this.ismenu;
    }
    /** 菜单 */
    public void setIsmenu(Integer ismenu){
        this.ismenu = ismenu;
    }
    /** 所属父类 */
    public Integer getParentid(){
        return this.parentid;
    }
    /** 所属父类 */
    public void setParentid(Integer parentid){
        this.parentid = parentid;
    }
    /** 权限信息 */
    public String getPinfo(){
        return this.pinfo;
    }
    /** 权限信息 */
    public void setPinfo(String pinfo){
        this.pinfo = pinfo;
    }
    /** 乐观锁 */
    public Integer getRevision(){
        return this.revision;
    }
    /** 乐观锁 */
    public void setRevision(Integer revision){
        this.revision = revision;
    }
    /** 创建时间 */
    public Date getCreatedTime(){
        return this.createdTime;
    }
    /** 创建时间 */
    public void setCreatedTime(Date createdTime){
        this.createdTime = createdTime;
    }
    /** 更新时间 */
    public Date getUpdatedTime(){
        return this.updatedTime;
    }
    /** 更新时间 */
    public void setUpdatedTime(Date updatedTime){
        this.updatedTime = updatedTime;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "permissionid=" + permissionid +
                ", pname='" + pname + '\'' +
                ", purl='" + purl + '\'' +
                ", ismenu=" + ismenu +
                ", parentid=" + parentid +
                ", pinfo='" + pinfo + '\'' +
                ", revision=" + revision +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                ", list=" + list +
                ", rp=" + rp +
                '}';
    }
}

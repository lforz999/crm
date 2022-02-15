package com.bus.entity;


import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Repository
@Table(name="rolepermission")
public class RolePermission implements Serializable,Cloneable{
    /** 角色权限id */
    @Id
    private Integer id ;
    /** 角色id */
    private Integer rid ;
    /** 权限id */
    private Integer permissionid ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新时间 */
    private Date updatedTime ;

    private List<RolePermission> list;

    private Role r;

    private Permission p;

    public RolePermission() {
    }


    public RolePermission(Integer rid, Integer permissionid) {
        this.rid = rid;
        this.permissionid = permissionid;
    }

    public RolePermission(Role r, Permission p) {
        this.r = r;
        this.p = p;
    }

    public RolePermission(Integer id, Integer rid, Integer permissionid) {
        this.id = id;
        this.rid = rid;
        this.permissionid = permissionid;
    }

    public List<RolePermission> getList() {
        return list;
    }

    public void setList(List<RolePermission> list) {
        this.list = list;
    }

    public Role getR() {
        return r;
    }

    public void setR(Role r) {
        this.r = r;
    }

    public Permission getP() {
        return p;
    }

    public void setP(Permission p) {
        this.p = p;
    }

    /** 角色权限id */
    public Integer getId(){
        return this.id;
    }
    /** 角色权限id */
    public void setId(Integer id){
        this.id = id;
    }
    /** 角色id */
    public Integer getRid(){
        return this.rid;
    }
    /** 角色id */
    public void setRid(Integer rid){
        this.rid = rid;
    }
    /** 权限id */
    public Integer getPermissionid(){
        return this.permissionid;
    }
    /** 权限id */
    public void setPermissionid(Integer permissionid){
        this.permissionid = permissionid;
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
        return "RolePermission{" +
                "id=" + id +
                ", rid=" + rid +
                ", permissionid=" + permissionid +
                ", revision=" + revision +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                ", list=" + list +
                ", r=" + r +
                ", p=" + p +
                '}';
    }
}

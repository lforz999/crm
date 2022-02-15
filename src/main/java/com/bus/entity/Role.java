package com.bus.entity;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Table(name="role")
public class Role implements Serializable,Cloneable{
    /** 角色id */
    @Id
    private Integer rid ;
    /** 角色名 */
    private String roleName ;
    /** 角色说明 */
    private String roleDesc ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新时间 */
    private Date updatedTime ;


    public Role() {
    }

    public Role(Integer rid) {
        this.rid = rid;
    }

    public Role(String roleName) {
        this.roleName = roleName;
    }

    public Role(String roleName, String roleDesc) {
        this.roleName = roleName;
        this.roleDesc = roleDesc;
    }

    public Role(Integer rid, String roleName, String roleDesc) {
        this.rid = rid;
        this.roleName = roleName;
        this.roleDesc = roleDesc;
    }

    /** 角色id */
    public Integer getRid(){
        return this.rid;
    }
    /** 角色id */
    public void setRid(Integer rid){
        this.rid = rid;
    }
    /** 角色名 */
    public String getRoleName(){
        return this.roleName;
    }
    /** 角色名 */
    public void setRoleName(String roleName){
        this.roleName = roleName;
    }
    /** 角色说明 */
    public String getRoleDesc(){
        return this.roleDesc;
    }
    /** 角色说明 */
    public void setRoleDesc(String roleDesc){
        this.roleDesc = roleDesc;
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
        return "Role{" +
                "rid=" + rid +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                ", revision=" + revision +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                '}';
    }
}
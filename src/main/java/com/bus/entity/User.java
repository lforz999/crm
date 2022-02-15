package com.bus.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Table(name="user")
public class User implements Serializable,Cloneable{
    /** 用户id */
    @Id
    private Integer uid ;
    /** 用户名 */
    private String userName ;
    /** 用户密码 */
    private String userPassword ;
    /** 用户的角色 */
    private Integer rid ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新时间 */
    private Date updatedTime ;

    private Role r;

    public User() {
    }

    public User(String userName) {
        this.userName = userName;
    }


    public User(String userName, String userPassword) {
        this.userName = userName;
        this.userPassword = userPassword;
    }

    public User(Integer uid, String userName, String userPassword) {
        this.uid = uid;
        this.userName = userName;
        this.userPassword = userPassword;
    }

    public User(String userName, String userPassword, Integer rid) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.rid = rid;
    }

    public User(Integer uid, String userName, String userPassword, Integer rid) {
        this.uid = uid;
        this.userName = userName;
        this.userPassword = userPassword;
        this.rid = rid;
    }

    public Role getR() {
        return r;
    }

    public void setR(Role r) {
        this.r = r;
    }

    /** 用户id */
    public Integer getUid(){
        return this.uid;
    }
    /** 用户id */
    public void setUid(Integer uid){
        this.uid = uid;
    }
    /** 用户名 */
    public String getUserName(){
        return this.userName;
    }
    /** 用户名 */
    public void setUserName(String userName){
        this.userName = userName;
    }
    /** 用户密码 */
    public String getUserPassword(){
        return this.userPassword;
    }
    /** 用户密码 */
    public void setUserPassword(String userPassword){
        this.userPassword = userPassword;
    }
    /** 用户的角色 */
    public Integer getRid(){
        return this.rid;
    }
    /** 用户的角色 */
    public void setRid(Integer rid){
        this.rid = rid;
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
        return "User{" +
                "uid=" + uid +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", rid=" + rid +
                ", revision=" + revision +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                '}';
    }
}

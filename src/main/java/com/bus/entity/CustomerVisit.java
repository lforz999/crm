package com.bus.entity;


import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Repository
@Table(name="customervisit")
public class CustomerVisit implements Serializable,Cloneable{
    /** 客户拜访id */
    @Id
    private Integer id ;
    /** 客户id */
    private Integer cid ;
    /** 用户id */
    private Integer uid ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新时间 */
    private Date updatedTime ;

    private Customer c;

    private User u;

    public CustomerVisit() {
    }

    public CustomerVisit(Integer cid) {
        this.cid = cid;
    }

    public CustomerVisit(Customer c) {
        this.c = c;
    }

    public CustomerVisit(Integer cid, Integer uid) {
        this.cid = cid;
        this.uid = uid;
    }

    public CustomerVisit(Integer id, Integer cid, Integer uid) {
        this.id = id;
        this.cid = cid;
        this.uid = uid;
    }

    public Customer getC() {
        return c;
    }

    public void setC(Customer c) {
        this.c = c;
    }

    public User getU() {
        return u;
    }

    public void setU(User u) {
        this.u = u;
    }

    /** 客户拜访id */
    public Integer getId(){
        return this.id;
    }
    /** 客户拜访id */
    public void setId(Integer id){
        this.id = id;
    }
    /** 客户id */
    public Integer getCid(){
        return this.cid;
    }
    /** 客户id */
    public void setCid(Integer cid){
        this.cid = cid;
    }
    /** 用户id */
    public Integer getUid(){
        return this.uid;
    }
    /** 用户id */
    public void setUid(Integer uid){
        this.uid = uid;
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
        return "CustomerVisit{" +
                "id=" + id +
                ", cid=" + cid +
                ", uid=" + uid +
                ", revision=" + revision +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                ", c=" + c +
                ", u=" + u +
                '}';
    }
}

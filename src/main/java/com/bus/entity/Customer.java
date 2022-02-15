package com.bus.entity;


import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Table(name="customer")
public class Customer implements Serializable,Cloneable{
    /** 客户id */
    @Id
    private Integer cid ;
    /** 客户名称 */
    private String cusname ;
    /** 乐观锁 */
    private Integer revision ;
    /** 创建时间 */
    private Date createdTime ;
    /** 更新时间 */
    private Date updatedTime ;

    public Customer() {
    }

    public Customer(Integer cid) {
        this.cid = cid;
    }

    public Customer(String cusname) {
        this.cusname = cusname;
    }

    public Customer(Integer cid, String cusname) {
        this.cid = cid;
        this.cusname = cusname;
    }

    /** 客户id */
    public Integer getCid(){
        return this.cid;
    }
    /** 客户id */
    public void setCid(Integer cid){
        this.cid = cid;
    }
    /** 客户名称 */
    public String getCusname(){
        return this.cusname;
    }
    /** 客户名称 */
    public void setCusname(String cusname){
        this.cusname = cusname;
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
        return "Customer{" +
                "cid=" + cid +
                ", cusname='" + cusname + '\'' +
                ", revision=" + revision +
                ", createdTime=" + createdTime +
                ", updatedTime=" + updatedTime +
                '}';
    }
}

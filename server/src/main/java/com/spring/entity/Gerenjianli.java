package com.spring.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;
import net.jntoo.db.Query;

@Table(name = "gerenjianli")
public class Gerenjianli implements Serializable {
    @GeneratedValue(generator = "JDBC") // 自增的主键映射
    @Id
    @Column(name = "id",insertable=false)
    private Integer id;

    @Column(name = "jianlibianhao")
    private String jianlibianhao;
    @Column(name = "jianlileixing")
    private String jianlileixing;
    @Column(name = "xingming")
    private String xingming;
    @Column(name = "xingbie")
    private String xingbie;
    @Column(name = "nianling")
    private Integer nianling;
    @Column(name = "dianziyouxiang")
    private String dianziyouxiang;
    @Column(name = "lianxidianhua")
    private String lianxidianhua;
    @Column(name = "xueli")
    private String xueli;
    @Column(name = "biyeyuanxiao")
    private String biyeyuanxiao;
    @Column(name = "suoxuezhuanye")
    private String suoxuezhuanye;
    @Column(name = "gongzuojingli")
    private String gongzuojingli;
    @Column(name = "ziwopingjia")
    private String ziwopingjia;
    @Column(name = "jianliwenjian")
    private String jianliwenjian;
    @Column(name = "tianjiaren")
    private String tianjiaren;
    @Column(name = "addtime")
    private String addtime;


    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getJianlibianhao() {
        return jianlibianhao;
    }
    public void setJianlibianhao(String jianlibianhao) {
        this.jianlibianhao = jianlibianhao == null ? "" : jianlibianhao.trim();
    }

    public String getJianlileixing() {
        return jianlileixing;
    }
    public void setJianlileixing(String jianlileixing) {
        this.jianlileixing = jianlileixing == null ? "" : jianlileixing.trim();
    }

    public String getXingming() {
        return xingming;
    }
    public void setXingming(String xingming) {
        this.xingming = xingming == null ? "" : xingming.trim();
    }

    public String getXingbie() {
        return xingbie;
    }
    public void setXingbie(String xingbie) {
        this.xingbie = xingbie == null ? "" : xingbie.trim();
    }

    public Integer getNianling() {
        return nianling;
    }
    public void setNianling(Integer nianling) {
        this.nianling = nianling == null ? 0 : nianling;
    }

    public String getDianziyouxiang() {
        return dianziyouxiang;
    }
    public void setDianziyouxiang(String dianziyouxiang) {
        this.dianziyouxiang = dianziyouxiang == null ? "" : dianziyouxiang.trim();
    }

    public String getLianxidianhua() {
        return lianxidianhua;
    }
    public void setLianxidianhua(String lianxidianhua) {
        this.lianxidianhua = lianxidianhua == null ? "" : lianxidianhua.trim();
    }

    public String getXueli() {
        return xueli;
    }
    public void setXueli(String xueli) {
        this.xueli = xueli == null ? "" : xueli.trim();
    }

    public String getBiyeyuanxiao() {
        return biyeyuanxiao;
    }
    public void setBiyeyuanxiao(String biyeyuanxiao) {
        this.biyeyuanxiao = biyeyuanxiao == null ? "" : biyeyuanxiao.trim();
    }

    public String getSuoxuezhuanye() {
        return suoxuezhuanye;
    }
    public void setSuoxuezhuanye(String suoxuezhuanye) {
        this.suoxuezhuanye = suoxuezhuanye == null ? "" : suoxuezhuanye.trim();
    }

    public String getGongzuojingli() {
        return gongzuojingli;
    }
    public void setGongzuojingli(String gongzuojingli) {
        this.gongzuojingli = gongzuojingli == null ? "" : gongzuojingli.trim();
    }

    public String getZiwopingjia() {
        return ziwopingjia;
    }
    public void setZiwopingjia(String ziwopingjia) {
        this.ziwopingjia = ziwopingjia == null ? "" : ziwopingjia.trim();
    }

    public String getJianliwenjian() {
        return jianliwenjian;
    }
    public void setJianliwenjian(String jianliwenjian) {
        this.jianliwenjian = jianliwenjian == null ? "" : jianliwenjian.trim();
    }

    public String getTianjiaren() {
        return tianjiaren;
    }
    public void setTianjiaren(String tianjiaren) {
        this.tianjiaren = tianjiaren == null ? "" : tianjiaren.trim();
    }

    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? "" : addtime.trim();
    }

}

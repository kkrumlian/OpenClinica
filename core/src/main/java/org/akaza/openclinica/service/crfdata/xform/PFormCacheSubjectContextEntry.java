package org.akaza.openclinica.service.crfdata.xform;

public class PFormCacheSubjectContextEntry {

    private String studySubjectOid = null;
    private Integer studyEventDefinitionId = null;
    private Integer ordinal = null;
    private String crfVersionOid = null;
    private String formLayoutOid = null;
    private Integer userAccountId = null;
    private String itemName = null;
    private Integer itemRepeatOrdinal = null;
    private boolean isItemInRepeatingGroup = false;
    private String itemRepeatGroupName = null;

    public String getStudySubjectOid() {
        return studySubjectOid;
    }

    public void setStudySubjectOid(String studySubjectOid) {
        this.studySubjectOid = studySubjectOid;
    }

    public Integer getStudyEventDefinitionId() {
        return studyEventDefinitionId;
    }

    public void setStudyEventDefinitionId(Integer studyEventDefinitionId) {
        this.studyEventDefinitionId = studyEventDefinitionId;
    }

    public Integer getOrdinal() {
        return ordinal;
    }

    public void setOrdinal(Integer ordinal) {
        this.ordinal = ordinal;
    }

    public String getCrfVersionOid() {
        return crfVersionOid;
    }

    public void setCrfVersionOid(String crfVersionOid) {
        this.crfVersionOid = crfVersionOid;
    }

    public Integer getUserAccountId() {
        return userAccountId;
    }

    public void setUserAccountId(Integer userAccountId) {
        this.userAccountId = userAccountId;
    }

    public String getFormLayoutOid() {
        return formLayoutOid;
    }

    public void setFormLayoutOid(String formLayoutOid) {
        this.formLayoutOid = formLayoutOid;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getItemRepeatOrdinal() {
        return itemRepeatOrdinal;
    }

    public void setItemRepeatOrdinal(Integer itemRepeatOrdinal) {
        this.itemRepeatOrdinal = itemRepeatOrdinal;
    }

    public boolean isItemInRepeatingGroup() {
        return isItemInRepeatingGroup;
    }

    public void setItemInRepeatingGroup(boolean isItemInRepeatingGroup) {
        this.isItemInRepeatingGroup = isItemInRepeatingGroup;
    }

    public String getItemRepeatGroupName() {
        return itemRepeatGroupName;
    }

    public void setItemRepeatGroupName(String itemRepeatGroupName) {
        this.itemRepeatGroupName = itemRepeatGroupName;
    }

}

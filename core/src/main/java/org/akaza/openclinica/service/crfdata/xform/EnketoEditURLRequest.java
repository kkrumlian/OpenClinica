package org.akaza.openclinica.service.crfdata.xform;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.HashMap;
import java.util.Map;

public class EnketoEditURLRequest {

    private String server_url = null;
    private String form_id = null;
    private String instance_id = null;
    private String return_url = null;
    private String instance = null;
    private String complete_button = null;
    @JsonProperty("go_to")
    private String goTo = null;
    private String load_warning = null;
    @JsonProperty("ecid")
    private String ecId = null;
    private String jini = null;
    private String pid = null;
    @JsonProperty("parent_window_origin")
    private String parentWindowOrigin = null;

    public String getLoad_warning() {
        return load_warning;
    }

    public void setLoad_warning(String load_warning) {
        this.load_warning = load_warning;
    }

    @JsonProperty("instance_attachments")
    private InstanceAttachment instanceAttachments;
    @JsonIgnore
    private Map<String, String> additionalProperties = new HashMap<String, String>();

    @JsonProperty("instance_attachments")
    public InstanceAttachment getInstanceAttachments() {
        return instanceAttachments;
    }

    @JsonProperty("instance_attachments")
    public void setInstanceAttachments(InstanceAttachment instanceAttachments) {
        this.instanceAttachments = instanceAttachments;
    }

    @JsonAnyGetter
    public Map<String, String> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperty(String name, String value) {
        this.additionalProperties.put(name, value);
    }

    public EnketoEditURLRequest(String server_url, String ecId, String form_id, String instance_id, String return_url, String instance, String complete_button,
            InstanceAttachment instanceAttachments, String goTo, String load_warning, String jini, String pid, String parentWindowOrigin) {
        this.server_url = server_url;
        this.form_id = form_id;
        this.instance_id = instance_id;
        this.return_url = return_url;
        this.instance = instance;
        this.complete_button = complete_button;
        this.instanceAttachments = instanceAttachments;
        this.goTo = goTo;
        this.load_warning = load_warning;
        this.ecId = ecId;
        this.jini = jini;
        this.pid = pid;
        this.parentWindowOrigin = parentWindowOrigin;
    }

    public String getServer_url() {
        return server_url;
    }

    public void setServer_url(String server_url) {
        this.server_url = server_url;
    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public String getInstance_id() {
        return instance_id;
    }

    public void setInstance_id(String instance_id) {
        this.instance_id = instance_id;
    }

    public String getReturn_url() {
        return return_url;
    }

    public void setReturn_url(String return_url) {
        this.return_url = return_url;
    }

    public String getInstance() {
        return instance;
    }

    public void setInstance(String instance) {
        this.instance = instance;
    }

    public String getComplete_button() {
        return complete_button;
    }

    public void setComplete_button(String complete_button) {
        this.complete_button = complete_button;
    }

    public String getGoTo() {
        return goTo;
    }

    public void setGoTo(String goTo) {
        this.goTo = goTo;
    }

    public String getEcId() {
        return ecId;
    }

    public void setEcId(String ecId) {
        this.ecId = ecId;
    }
    public String getJini() {
        return jini;
    }

    public void setJini(String jini) {
        this.jini = jini;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getParentWindowOrigin() {
        return parentWindowOrigin;
    }

    public void setParentWindowOrigin(String parentWindowOrigin) {
        this.parentWindowOrigin = parentWindowOrigin;
    }
}

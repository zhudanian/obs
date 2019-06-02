package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Contact implements Serializable {

    private Integer contactId;
    private String contactName;
    private String contactAddress;
    private String contactPhone;

    private Customer customer;

    @Override
    public String toString() {
        return "Contact{" +
                "contactId=" + contactId +
                ", contactName='" + contactName + '\'' +
                ", contactAddress='" + contactAddress + '\'' +
                ", contactPhone='" + contactPhone + '\'' +
                ", customer=" + customer +
                '}';
    }
}

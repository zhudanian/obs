package cn.zdn.obs.service;

import cn.zdn.obs.model.Contact;

import java.util.List;

public interface ContactService {
    List<Contact> queryAllContact(Integer customerId);

    Integer addAddress(Contact contact);

    Integer modifyAddress(Contact contact);

    Integer removeAddress(Integer contactId);

    Contact queryAddressById(Integer contactId);
}

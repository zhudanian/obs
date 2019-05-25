package cn.zdn.obs.service;

import cn.zdn.obs.model.Contact;

import java.util.List;

public interface ContactService {
    List<Contact> queryAllContact(Integer customerId);
}

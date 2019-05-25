package cn.zdn.obs.dao;

import cn.zdn.obs.model.Contact;

import java.util.List;

public interface ContactDao {

    List<Contact> selectAll(Integer customerId);

    Contact selectByContactId(Integer contactId);

    Integer update(Contact contact);

    Integer insert(Contact contact);

    Integer delete(Integer contactId);
}

package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.ContactDao;
import cn.zdn.obs.model.Contact;
import cn.zdn.obs.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {
    @Autowired
    private ContactDao contactDao;

    @Override
    public List<Contact> queryAllContact(Integer customerId) {
        return contactDao.selectAll(customerId);
    }

    @Override
    public Integer addAddress(Contact contact) {
        return contactDao.insert(contact);
    }

    @Override
    public Integer modifyAddress(Contact contact) {
        return contactDao.update(contact);
    }

    @Override
    public Integer removeAddress(Integer contactId) {
        return contactDao.delete(contactId);
    }

    @Override
    public Contact queryAddressById(Integer contactId) {
        return contactDao.selectByContactId(contactId);
    }
}

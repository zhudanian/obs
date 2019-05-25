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
}

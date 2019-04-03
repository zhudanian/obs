package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.CustomerDao;
import cn.zdn.obs.dao.CustomerDao;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;

    @Override
    public Customer queryByCustomerId(Integer customerId) {

        return customerDao.select(customerId);
    }

    @Override
    public List<Customer> queryAll() {
        return customerDao.selectAll();
    }

    @Override
    public Integer add(Customer customer) {
        return customerDao.insert(customer);
    }

    @Override
    public Integer modify(Customer customer) {
        return customerDao.update(customer);
    }

    @Override
    public Integer remove(Integer customerId) {
        return customerDao.delete(customerId);
    }
}

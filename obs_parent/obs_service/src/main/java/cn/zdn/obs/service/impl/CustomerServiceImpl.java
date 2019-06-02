package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.CustomerDao;
import cn.zdn.obs.dao.CustomerDao;
import cn.zdn.obs.exceptions.CustomerNotExistException;
import cn.zdn.obs.model.Contact;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.params.CustomerParam;
import cn.zdn.obs.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
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
    public Customer queryCustomerByNameAndPassword(String customerName, String customerPassword) throws CustomerNotExistException {
        Customer customer = customerDao.selectCustomerByNameAndPassword(customerName, DigestUtils.md5DigestAsHex(customerPassword.getBytes()));
        if (customer != null) {
            return customer;
        }
        throw new CustomerNotExistException("用户名或密码不正确");
    }

    @Override
    public boolean checkCustomerName(String customerName) {
        Customer customer = customerDao.selectCustomerByCustomerName(customerName);
        if(customer!=null){
            return false;
        }
        return true;
    }

    @Override
    public List<Customer> queryByCustomerParam(CustomerParam customerParam) {
        return customerDao.selectByCustomerParam(customerParam);
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

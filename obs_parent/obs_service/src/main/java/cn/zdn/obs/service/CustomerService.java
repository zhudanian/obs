package cn.zdn.obs.service;

import cn.zdn.obs.exceptions.CustomerNotExistException;
import cn.zdn.obs.model.Contact;
import cn.zdn.obs.model.Customer;
import cn.zdn.obs.params.CustomerParam;

import java.util.List;

public interface CustomerService {

    List<Customer> queryAll();

    Customer queryByCustomerId(Integer customerId);

    Integer modify(Customer customer);

    Integer remove(Integer bookId);

    Integer add(Customer customer);

    Customer queryCustomerByNameAndPassword(String customerName, String customerPassword) throws CustomerNotExistException;

    boolean checkCustomerName(String customerName);

    List<Customer> queryByCustomerParam(CustomerParam customerParam);

}

package cn.zdn.obs.service;

import cn.zdn.obs.model.Customer;

import java.util.List;

public interface CustomerService {

    List<Customer> queryAll();

    Customer queryByCustomerId(Integer customerId);

    Integer modify(Customer customer);

    Integer remove(Integer bookId);

    Integer add(Customer customer);
}

package cn.zdn.obs.dao;


import cn.zdn.obs.model.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerDao {

    Customer select(Integer customerId);

    List<Customer> selectAll();

    Integer insert(Customer customer);

    Integer update(Customer customer);

    Integer delete(Integer customerId);

    Customer selectCustomerByNameAndPassword(@Param("customerName") String customerName, @Param("customerPassword")String customerPassword);
}

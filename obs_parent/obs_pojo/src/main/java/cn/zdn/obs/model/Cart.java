package cn.zdn.obs.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class Cart {

    private Integer cartId;
    private Integer bookQuantity;
    private BigDecimal bookTotalPrice;

    //购物车对人 ：一对一
    private Customer customer;

    //购物车和书 ：一对多
    private List<Book> bookList;


}

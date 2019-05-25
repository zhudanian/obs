package cn.zdn.obs.dao;


import cn.zdn.obs.model.BookCartItem;

import java.util.List;
import java.util.Map;

public interface BookCartDao {

    List<BookCartItem> selectCartByCustomerId(Integer customerId);
}

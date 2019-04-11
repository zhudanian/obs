package cn.zdn.obs.cart;


import cn.zdn.obs.model.Book;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Author:hellboy
 * Date:2018-11-21 11:15
 * Description:
 * 购物车对象，里面是购物车明细,用于完成购物功能
 */
public class ShoppingCart {

    private Map<Integer,ShoppingCartItem> books = new HashMap<>();


    public Map<Integer, ShoppingCartItem> getBooks() {
        return books;
    }

    /**
     * 向购物车添加一件商品
     * 逻辑：
     * 查看当前购物车中是否已经有该商品，如果有,不新增记录，只数量+1，如果没有，在购物车中新增一条记录，数量初始化为1
     *
     */
    public void addBook(Book book){
        ShoppingCartItem sci= books.get(book.getBookId());
        if(sci==null){
            sci=new ShoppingCartItem(book);
            books.put(book.getBookId(),sci);
        }
        else{
            sci.increment();
        }

    }

    /**
     * 查看购物车中是否有该商品
     *
     */
    public boolean hasBook(int id){
        return books.containsKey(id);
    }

    /**
     * 获取购物车中的商品总数
     * 逻辑：
     * 遍历购物车集合，获取所有购物车明细，求数量之和
     */
    public int getBookNumber(){
        int total=0;
        for (ShoppingCartItem sci : books.values()) {
            total+=sci.getQuantity();

        }
        return  total;
    }

    /**
     * 获取购物车中所有明细的集合
     */
    public Collection<ShoppingCartItem> getItems(){
        return books.values();
    }

    /**
     * 获取购物车中所有商品的总价
     *
     */
    public BigDecimal getTotalMoney(){
        BigDecimal total=new BigDecimal(0.00);
        for (ShoppingCartItem sci :getItems()) {
            total=sci.getItemMoney().add(total);
        }
        return  total;
    }

    /**
     * 判断购物车是否为空
     */
    public boolean isEmpty(){
        return  books.isEmpty();

    }

    /**
     * 清空购物车
     */
    public void clear(){

        books.clear();

    }

    /**
     * 移除指定id的购物明细
     */
    public void removeItem(int id){
        books.remove(id);
    }

    /**
     * 修改指定购物明细的数量
     */
    public void updateItemQuantity(int id,int quantity){
        ShoppingCartItem sci = books.get(id);
        if(sci!=null){
            sci.setQuantity(quantity);
        }
    }

















}



package cn.zdn.obs.cart;

import cn.zdn.obs.model.Book;

import java.math.BigDecimal;

public class ShoppingCartItem {

    //产品对象
    private Book book;

    //数量
    private int quantity;

    public ShoppingCartItem() {
    }

    /*
    默认一次只能买一件商品
     */
    public ShoppingCartItem(Book book) {
        this.book = book;
        this.quantity=1;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    //获取该商品在购物车中的总价
    public BigDecimal getItemMoney(){
        return book.getBookPrice().multiply(new BigDecimal(this.quantity));
    }

    //商品数量+1
    public void increment(){
        this.quantity++;
    }




}

package cn.zdn.obs.model;

import java.math.BigDecimal;

public class CartBook {

    private Integer cartId;
    private Integer customerId;
    private Integer bookQuantity;
    private BigDecimal bookTotalPrice;
    private Book book;

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Customer customer) {
         this.cartId = customer.getCustomerId();
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customer) {
        this.customerId = customer.getCustomerId();
    }

    public Integer getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(Integer bookQuantity) {
        this.bookQuantity = bookQuantity;
    }

    public BigDecimal getBookTotalPrice() {
        return book.getBookPrice().multiply(new BigDecimal(this.bookQuantity));
    }

    public void setBookTotalPrice(BigDecimal bookTotalPrice) {
        this.bookTotalPrice = bookTotalPrice;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }


    //商品数量+1
    public void increment() {
        this.bookQuantity++;
    }

    public CartBook() {
    }
    
    //默认一次只能买一件商品
    public CartBook(Book book) {
        this.book = book;
        this.bookQuantity = 1;
    }
    public CartBook(Integer cartId, Integer customerId, Integer bookQuantity, BigDecimal bookTotalPrice, Book book) {
        this.cartId = cartId;
        this.customerId = customerId;
        this.bookQuantity = bookQuantity;
        this.bookTotalPrice = bookTotalPrice;
        this.book = book;
    }
}

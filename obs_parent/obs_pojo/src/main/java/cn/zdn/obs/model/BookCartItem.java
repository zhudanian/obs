package cn.zdn.obs.model;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class BookCartItem {

    private Integer bookCartItemId;
    private Book book;
    private Integer num;
    private Integer customerId;

    public BookCartItem() {
    }

    public BookCartItem(Book book, Integer num) {
        this.book = book;
        this.num = num;
    }

    public BookCartItem(Integer bookCartItemId, Book book, Integer num, Integer customerId) {
        this.bookCartItemId = bookCartItemId;
        this.book = book;
        this.num = num;
        this.customerId = customerId;
    }

    public BigDecimal getItemMoney() {
        return book.getBookPrice().multiply(new BigDecimal(this.num));
    }

}

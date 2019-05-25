package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class OrderBook implements Serializable {

    private Integer id;
    private Integer num;
    private Book book;

    public OrderBook() {
    }

    public OrderBook(Integer id, Integer num, Book book) {
        this.id = id;
        this.num = num;
        this.book = book;
    }
}

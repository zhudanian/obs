package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class Book implements Serializable {
    private Integer bookId;
    private String bookName;
    private String bookAuthor;
    private String bookImage;
    private String bookPress;
    private BigDecimal bookPrice;
    private String bookDescription;
    private Integer bookHot;
    private BookType BookType;
 //   private Comment comment;
}

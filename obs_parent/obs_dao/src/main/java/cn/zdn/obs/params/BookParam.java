package cn.zdn.obs.params;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class BookParam {
    private String bookName;
    private String bookAuthor;
    private String bookPress;
//    private BigDecimal minPrice;
//    private BigDecimal maxPrice;
    private String bookTypeName;
    private Integer bookTypeId;

    public BookParam() {
    }

    public BookParam(String bookName, String bookAuthor, String bookPress, BigDecimal minPrice, BigDecimal maxPrice, String bookTypeName, Integer bookTypeId) {
        this.bookName = bookName;
        this.bookAuthor = bookAuthor;
        this.bookPress = bookPress;
//        this.minPrice = minPrice;
//        this.maxPrice = maxPrice;
        this.bookTypeName = bookTypeName;
        this.bookTypeId = bookTypeId;
    }

    /*private Boolean bookHot;*/
}

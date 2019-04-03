package cn.zdn.obs.params;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class BookParam {
    private String bookName;
    private String bookAuthor;
    private String bookPress;
    private BigDecimal minPrice;
    private BigDecimal maxPrice;
    private Integer bookTypeId;
    /*private Boolean bookHot;*/
}

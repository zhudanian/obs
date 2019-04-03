package cn.zdn.obs.backend.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
@Data
public class BookVO implements Serializable {
    private Integer bookId;
    private String bookName;
    private String bookAuthor;
    private String bookImage;
    private String bookPress;
    private BigDecimal bookPrice;
    private String bookDescription;
    private Integer bookTypeId;
}

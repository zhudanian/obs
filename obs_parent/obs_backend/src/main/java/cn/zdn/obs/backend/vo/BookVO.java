package cn.zdn.obs.backend.vo;

import lombok.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.Serializable;
import java.math.BigDecimal;
@Data
public class BookVO implements Serializable {
    private Integer bookId;
    private String bookName;
    private String bookAuthor;
    private String bookPress;
    private BigDecimal bookPrice;
    private String bookDescription;
    private Integer bookTypeId;
    //springmvc上传附件必须使用CommonsMultipartFile
    private CommonsMultipartFile file;
}

package cn.zdn.obs.dto;

import lombok.Data;

import java.io.InputStream;
import java.math.BigDecimal;

@Data
public class BookDto {

    private Integer bookId;
    private String bookName;
    private String bookAuthor;
    private String bookPress;

    private BigDecimal bookPrice;

    private Integer BookTypeId;

    //springmvc上传附件必须使用CommonsMultipartFile
    //private CommonsMultipartFile file;

    //文件的输入流
    private InputStream inputStream;

    //文件的名称
    private String fileName;

    //文件的上传路径
    private String uploadPath;


}

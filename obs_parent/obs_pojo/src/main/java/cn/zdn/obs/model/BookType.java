package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class BookType implements Serializable {
    private Integer bookTypeId;
    private String bookTypeName;
    private Integer bookTypeState;

    //类型对书 ：一对多
    private List<Book> bookList;

}

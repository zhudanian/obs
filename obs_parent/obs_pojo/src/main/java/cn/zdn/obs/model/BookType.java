package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class BookType implements Serializable {
    private Integer bookTypeId;
    private String bookTypeName;
    private Integer bookTypeState;

}

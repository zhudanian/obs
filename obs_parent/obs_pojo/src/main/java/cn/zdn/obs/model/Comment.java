package cn.zdn.obs.model;

import lombok.Data;

import java.io.Serializable;
@Data
public class Comment implements Serializable {

    private String commentId;
    private String bookId;
    private String customerId;
    private String commentContent;

}

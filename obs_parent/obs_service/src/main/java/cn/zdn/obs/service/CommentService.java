package cn.zdn.obs.service;

import cn.zdn.obs.model.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> queryAll();

    Integer add(Comment comment);

    Integer remove(Integer commentId);

    Comment queryByCommentId(Integer commentId);

    Integer modify(Comment comment);
}

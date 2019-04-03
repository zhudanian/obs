package cn.zdn.obs.dao;


import cn.zdn.obs.model.Comment;

import java.util.List;

public interface CommentDao{

    Comment select(Integer commentId);

    List<Comment> selectAll();

    Integer insert(Comment comment);

    Integer update(Comment comment);

    Integer delete(Integer commentId);
}

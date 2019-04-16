package cn.zdn.obs.dao;


import cn.zdn.obs.model.Comment;

import java.util.List;

public interface CommentDao {

    //后台
    List<Comment> selectAll(Integer customerId);

    String selectUserResponse(Integer commentId);

    Integer updateUserResponse(String userResponse);

    //前台
    Comment selectByCustomerId(Integer commentId);

    Integer insert(Comment comment);

    Integer update(Comment comment);

    Integer delete(Integer commentId);
}

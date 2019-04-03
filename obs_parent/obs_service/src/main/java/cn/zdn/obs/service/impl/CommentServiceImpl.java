package cn.zdn.obs.service.impl;

import cn.zdn.obs.dao.CommentDao;
import cn.zdn.obs.model.Comment;
import cn.zdn.obs.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;

    @Override
    public Comment queryByCommentId(Integer commentId) {

        return commentDao.select(commentId);
    }

    @Override
    public List<Comment> queryAll() {
        return commentDao.selectAll();
    }

    @Override
    public Integer add(Comment comment) {
        return commentDao.insert(comment);
    }

    @Override
    public Integer modify(Comment comment) {
        return commentDao.update(comment);
    }

    @Override
    public Integer remove(Integer commentId) {
        return commentDao.delete(commentId);
    }
}

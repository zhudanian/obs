package cn.zdn.obs.dao;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<PK extends Serializable, E> {

    /**
     * 获取单条数据
     *
     * @param pk
     * @return
     **/
    E select(PK pk);

    /**
     * 查询所有数据列表
     *
     * @param
     * @return
     */
    List<E> selectAll();

    /**
     * 插入数据
     *
     * @param entity
     * @return
     */
    Integer insert(E entity);

    /**
     * 更新数据
     *
     * @param entity
     * @return
     */
    Integer update(E entity);

    /**
     * 删除数据
     *
     * @param pk
     * @return
     */
    Integer delete(PK pk);

}

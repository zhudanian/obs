package cn.zdn.obs.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Data
public class Cart {

    private Map<Integer, CartBook> books = new HashMap<>();

    public Map<Integer, CartBook> getBooks() {
        return books;
    }

    /**
     * 向购物车添加一件商品
     * 逻辑：
     * 查看当前购物车中是否已经有该商品，如果有,不新增记录，只数量+1，如果没有，在购物车中新增一条记录，数量初始化为1
     */
    public void addBook(Book book) {
        CartBook cartBook = books.get(book.getBookId());
        if (cartBook == null) {
            cartBook = new CartBook(book);
            books.put(book.getBookId(), cartBook);
        } else {
            cartBook.increment();
        }

    }

    /**
     * 查看购物车中是否有该商品
     */
    public boolean hasBook(int id) {
        return books.containsKey(id);
    }

    /**
     * 获取购物车中的商品总数
     * 逻辑：
     * 遍历购物车集合，获取所有购物车明细，求数量之和
     */
    public int getBookNumber() {
        int total = 0;
        for (CartBook cartBook : books.values()) {
            total += cartBook.getBookQuantity();

        }
        return total;
    }

    /**
     * 获取购物车中所有明细的集合
     */
    public Collection<CartBook> getItems() {
        return books.values();
    }

    /**
     * 获取购物车中所有商品的总价
     */
    public BigDecimal getTotalMoney() {
        BigDecimal total = new BigDecimal(0.00);
        for (CartBook cartBook : getItems()) {
            total = cartBook.getBookTotalPrice().add(total);
        }
        return total;
    }

    /**
     * 判断购物车是否为空
     */
    public boolean isEmpty() {
        return books.isEmpty();

    }

    /**
     * 清空购物车
     */
    public void clear() {

        books.clear();

    }

    /**
     * 移除指定id的购物明细
     */
    public void removeItem(int id) {
        books.remove(id);
    }

    /**
     * 修改指定购物明细的数量
     */
    public void updateItemQuantity(int id, int quantity) {
        CartBook cartBook = books.get(id);
        if (cartBook != null) {
            cartBook.setBookQuantity(quantity);
        }
    }



}

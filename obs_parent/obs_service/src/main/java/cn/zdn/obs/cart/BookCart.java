package cn.zdn.obs.cart;

import cn.zdn.obs.model.Book;
import cn.zdn.obs.model.BookCartItem;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Repository
public class BookCart {


    private Map<Integer, BookCartItem> books = new HashMap<>();


    public Map<Integer, BookCartItem> getBooks() {
        return books;
    }
    public void setBooks(Map<Integer, BookCartItem> books) {
         books=this.books;
    }


    /**
     * 向购物车添加一件商品
     * 逻辑：
     * 查看当前购物车中是否已经有该商品，如果有,不新增记录，数量加上原来的数量，如果没有，在购物车中新增一条记录，数量初始化为1
     *
     */
    public void addBookToCart(Book book, Integer num){
        BookCartItem bookCartItem= books.get(book.getBookId());
        if(bookCartItem==null){
            bookCartItem=new BookCartItem(book,num);
            books.put(book.getBookId(),bookCartItem);
        }
        else{
            bookCartItem.setNum(num+bookCartItem.getNum());
        }
    }

    /**
     * 获取购物车中所有明细的集合
     */
    public Collection<BookCartItem> getItems(){
        return books.values();
    }

    /**
     * 获取购物车中所有商品的总价
     *
     */
    public BigDecimal getTotalMoney(){
        BigDecimal total=new BigDecimal(0.00);
        for (BookCartItem bookCartItem :getItems()) {
            total=bookCartItem.getItemMoney().add(total);
        }
        return  total;
    }


    /**
     * 移除指定id的购物明细
     */
    public void removeBookItem(Integer bookId){
        books.remove(bookId);
    }


    /**
     * 修改指定购物明细的数量
     */
    public void updateBookNum(Integer bookId,Integer num){
        BookCartItem bookCartItem = books.get(bookId);
        if(bookCartItem!=null){
            bookCartItem.setNum(num);
        }
    }

    /**
     * 判断购物车是否为空
     */
    public boolean isEmpty(){
        return  books.isEmpty();

    }

    /**
     * 清空购物车
     */
    public void clear(){

        books.clear();

    }

    @Override
    public String toString() {
        return "BookCart{" +
                "books=" + books +
                '}';
    }
}

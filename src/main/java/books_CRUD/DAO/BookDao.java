package books_CRUD.DAO;
import books_CRUD.Model.Book;

import java.util.List;

public interface BookDao {
    List<Book> selectAll();
    boolean saveOrUpdate(Book book);
    boolean delete(Book book);
}

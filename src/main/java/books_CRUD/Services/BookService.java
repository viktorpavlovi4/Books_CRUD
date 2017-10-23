package books_CRUD.Services;
import books_CRUD.Model.Book;

import java.util.List;

public interface BookService {
    List<Book> selectAll();
    boolean saveOrUpdate(Book book);
    boolean delete(Book book);
}
